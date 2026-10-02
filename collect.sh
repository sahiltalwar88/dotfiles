#!/usr/bin/env bash
# Copy this machine's live setup into the repo, ready to commit.
# The shell and git dotfiles are symlinked by install.sh, so they need no
# collecting; this gathers what Claude Code and other tools write in place.
# Paths under $HOME are stored as __HOME__ so install.sh can re-root them.
set -euo pipefail

repo="$(cd "$(dirname "$0")" && pwd)"
claude_home="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
home_key="$(printf '%s' "$HOME" | sed 's/[^A-Za-z0-9]/-/g')"

rehome() { sed "s#$HOME#__HOME__#g" "$1" > "$2"; }

# Claude Code: global instructions, settings, status line, own skills.
mkdir -p "$repo/claude/skills"
cp "$claude_home/CLAUDE.md" "$repo/claude/CLAUDE.md"
cp "$claude_home/statusline.sh" "$repo/claude/statusline.sh"
rehome "$claude_home/settings.json" "$repo/claude/settings.json"
for skill in session-map; do
  mkdir -p "$repo/claude/skills/$skill"
  rehome "$claude_home/skills/$skill/SKILL.md" "$repo/claude/skills/$skill/SKILL.md"
done

# Claude Code memories, one folder per project. A project's folder name is
# its path with every non-alphanumeric character turned into "-", so it is
# stored without this machine's home prefix ("_home" for the home folder).
rm -rf "$repo/claude/memory"
for dir in "$claude_home"/projects/*/memory; do
  [ -n "$(ls -A "$dir" 2>/dev/null)" ] || continue
  key="$(basename "$(dirname "$dir")")"
  case "$key" in
    "$home_key") name=_home ;;
    "$home_key"-*) name="${key#"$home_key"-}" ;;
    *) continue ;; # outside $HOME (e.g. /tmp scratch projects): not worth keeping
  esac
  mkdir -p "$repo/claude/memory/$name"
  cp -R "$dir"/. "$repo/claude/memory/$name/"
done
if [ -d "$claude_home/memory-archive" ]; then
  rm -rf "$repo/claude/memory-archive"
  cp -R "$claude_home/memory-archive" "$repo/claude/memory-archive"
fi

echo "Collected into $repo. Review with: git -C \"$repo\" status"
