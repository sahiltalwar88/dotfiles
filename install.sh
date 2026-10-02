#!/usr/bin/env bash
# Set up this machine from the dotfiles repo: link the shell and git dotfiles,
# install the tools they expect, and restore the Claude Code setup.
# Safe to re-run. Anything it would replace is first moved to <file>.bak-<time>.
#
#   ./install.sh                  everything
#   SKIP_TOOLS=1 ./install.sh     don't download Starship or nvm
#   SKIP_PLUGINS=1 ./install.sh   don't install the Claude Code mods
set -euo pipefail

repo="$(cd "$(dirname "$0")" && pwd)"
claude_home="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
stamp="$(date +%Y%m%d-%H%M%S)"
mods_url="${CLAUDE_MODS_URL:-https://github.com/sahiltalwar88/claude-mods.git}"

is_mac() { [[ "$OSTYPE" == darwin* ]]; }
is_wsl() { grep -qi microsoft /proc/version 2>/dev/null; }
say() { printf '• %s\n' "$*"; }

backup() {
  local dest="$1"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mv "$dest" "$dest.bak-$stamp"
    say "backed up $dest to $dest.bak-$stamp"
  fi
}

# Symlink a repo file into place, so later edits on this machine land in the repo.
link() {
  local src="$repo/$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  [ "$(readlink "$dest" 2>/dev/null)" = "$src" ] && return
  backup "$dest"
  ln -s "$src" "$dest"
  say "linked $dest"
}

# Copy a repo file into place with __HOME__ replaced by this machine's home,
# then through an optional filter command. Used for files that tools rewrite
# in place, which collect.sh copies back.
render() {
  local src="$repo/$1" dest="$2" filter="${3:-cat}" tmp
  mkdir -p "$(dirname "$dest")"
  tmp="$(mktemp)"
  sed "s#__HOME__#$HOME#g" "$src" | $filter > "$tmp"
  if [ -f "$dest" ] && cmp -s "$tmp" "$dest"; then rm -f "$tmp"; return; fi
  backup "$dest"
  mv "$tmp" "$dest"
  say "wrote $dest"
}

# Copy every file under a repo folder that isn't already at the destination.
copy_missing() {
  local src="$1" dest="$2" rel
  (cd "$src" && find . -type f) | while IFS= read -r rel; do
    if [ ! -e "$dest/$rel" ]; then
      mkdir -p "$(dirname "$dest/$rel")"
      cp "$src/$rel" "$dest/$rel"
    fi
  done
}

# settings.json without the private mods, for machines that don't have them.
without_private_mods() {
  python3 -c '
import json, sys
settings = json.load(sys.stdin)
settings.get("extraKnownMarketplaces", {}).pop("sahil-private-mods", None)
plugins = settings.get("enabledPlugins", {})
for name in [n for n in plugins if n.endswith("@sahil-private-mods")]:
    del plugins[name]
print(json.dumps(settings, indent=2))
'
}

# --- Shell and git -----------------------------------------------------------
link .bashrc "$HOME/.bashrc"
link .bash_aliases "$HOME/.bash_aliases"
# macOS login shells read .bash_profile. On Linux it would stop ~/.profile
# (which already loads ~/.bashrc) from running, so it is macOS-only.
if is_mac; then link .bash_profile "$HOME/.bash_profile"; fi
link .gitconfig "$HOME/.gitconfig"
link .gitignore_global "$HOME/.gitignore_global"
link .config/git/ignore "$HOME/.config/git/ignore"
link .config/starship.toml "$HOME/.config/starship.toml"
if is_wsl; then link .gitconfig.wsl "$HOME/.gitconfig.local"; fi

# --- Tools the dotfiles expect ---------------------------------------------
if [ -z "${SKIP_TOOLS:-}" ]; then
  if ! command -v starship >/dev/null; then
    say "installing Starship into ~/.local/bin"
    mkdir -p "$HOME/.local/bin"
    curl -sS https://starship.rs/install.sh | sh -s -- -y -b "$HOME/.local/bin"
  fi
  if [ ! -s "$HOME/.nvm/nvm.sh" ]; then
    say "installing nvm"
    # PROFILE=/dev/null: .bashrc already loads nvm, so don't let the installer edit it.
    curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | PROFILE=/dev/null bash
  fi
fi
if command -v npm >/dev/null; then
  npm completion > "$HOME/.npm-completion.bash" 2>/dev/null || true
fi

# --- Claude Code ---------------------------------------------------------------
link claude/CLAUDE.md "$claude_home/CLAUDE.md"
link claude/statusline.sh "$claude_home/statusline.sh"
# Scripts behind /session-map and the session-summary hook.
link claude/bin "$claude_home/bin"
render claude/skills/session-map/SKILL.md "$claude_home/skills/session-map/SKILL.md"

# Mods: the public repo, cloned where settings.json expects it.
if [ ! -d "$HOME/dev/claude-mods" ]; then
  say "cloning $mods_url into ~/dev/claude-mods"
  git clone -q "$mods_url" "$HOME/dev/claude-mods"
fi

# settings.json, minus the private mods marketplace when it isn't on this machine.
if [ -d "$HOME/dev/claude-mods-private" ]; then
  render claude/settings.json "$claude_home/settings.json"
else
  render claude/settings.json "$claude_home/settings.json" without_private_mods
  say "settings leave out the private mods (~/dev/claude-mods-private isn't on this machine)"
fi

# Memories: one folder per project, named by the project's path under $HOME.
# Claude Code keys projects by path with every non-alphanumeric character as
# "-", so the key is rebuilt from this machine's home. Existing files win.
home_key="$(printf '%s' "$HOME" | sed 's/[^A-Za-z0-9]/-/g')"
for dir in "$repo"/claude/memory/*/; do
  [ -d "$dir" ] || continue
  name="$(basename "$dir")"
  if [ "$name" = _home ]; then key="$home_key"; else key="$home_key-$name"; fi
  copy_missing "$dir" "$claude_home/projects/$key/memory"
done
if [ -d "$repo/claude/memory-archive" ]; then
  copy_missing "$repo/claude/memory-archive" "$claude_home/memory-archive"
fi
say "restored Claude Code memories"

if [ -z "${SKIP_PLUGINS:-}" ] && command -v claude >/dev/null; then
  for plugin in still-going session-ledger; do
    claude plugin install "$plugin@sahil-mods" >/dev/null && say "installed $plugin" || say "could not install $plugin"
  done
fi

say "done. Open a new terminal to pick up the shell changes."
