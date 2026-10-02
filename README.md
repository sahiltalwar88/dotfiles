# dotfiles

My shell, git and Claude Code setup, for macOS and Linux (including WSL).

## Set up a new machine

```bash
git clone https://github.com/sahiltalwar88/dotfiles.git ~/dev/dotfiles
~/dev/dotfiles/install.sh
```

Then open a new terminal. `install.sh` is safe to run again; anything it would replace is first moved to `<file>.bak-<time>`. It:

- **Links the shell and git dotfiles** into your home folder, so later edits on any machine land in this repo.
- **Installs the tools they expect** if missing: [Starship](https://starship.rs) (the prompt) into `~/.local/bin`, and [nvm](https://github.com/nvm-sh/nvm). Skip with `SKIP_TOOLS=1`.
- **Restores the Claude Code setup:** global instructions, settings, status line, the `/session-map` skill with its session-summary hook, and memories. It clones [claude-mods](https://github.com/sahiltalwar88/claude-mods) into `~/dev/claude-mods` and installs those mods. Skip the mod install with `SKIP_PLUGINS=1`.

## Save this machine's Claude Code setup back to the repo

Claude Code writes its settings and memories in place, so those are copies rather than links:

```bash
~/dev/dotfiles/collect.sh   # then review and commit
```

Paths under your home folder are stored as `__HOME__`, so the same files work under `/Users/sahil` and `/home/sahil`.

## What's here

| Path | What it does |
|---|---|
| `.bashrc` | All interactive bash setup, shared by macOS and Linux: PATH, long history, colours, aliases, completion, nvm/RVM, WSL extras, Starship prompt |
| `.bash_profile` | macOS login shells only: raises the open-file limit, then loads `.bashrc`. Not installed on Linux, where it would stop `~/.profile` from running |
| `.bash_aliases` | Aliases (`c`, `a`, `nukenode`, `ll`, `alert`, …) |
| `.gitconfig` | Name and email, line endings, global ignore file, `main` as default branch, `git lg` graph log. Includes `~/.gitconfig.local` for machine-specific settings |
| `.gitconfig.wsl` | WSL only, linked as `~/.gitconfig.local`: use the Windows credential manager |
| `.gitignore_global`, `.config/git/ignore` | Files git ignores in every repo |
| `.config/starship.toml` | Prompt settings, tuned so it stays fast on WSL |
| `claude/` | Claude Code: `CLAUDE.md` (global instructions), `settings.json`, `statusline.sh`, `skills/session-map/`, and `memory/` (one folder per project, named by its path under the home folder) |
| `claude/bin/` | Linked as `~/.claude/bin`. `session-map.py` prints the session map (each session's name, full ID and latest summary) for the `/session-map` skill; `session-summary.py` is a Stop hook that has a small model write a one-sentence summary every 15 messages you type; `scan.sh` reads session names for both |
| `hooks/pre-commit` | Optional, per repo: blocks commits that add `.only` tests or `console.log`. Copy it to a repo's `.git/hooks/` and `chmod +x` it |
| `iterm-solarized-dark-with-terminal-shortcuts.json` | iTerm2 profile (macOS); import it in iTerm's preferences |
| `vscode-settings.json` | VS Code user settings |
