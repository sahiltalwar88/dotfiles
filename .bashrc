# ~/.bashrc: interactive bash setup, shared by macOS and Linux (including WSL).
# Login shells reach it too: on macOS via ~/.bash_profile, on Ubuntu via ~/.profile.

# If not running interactively, don't do anything.
case $- in
  *i*) ;;
  *) return ;;
esac

is_mac() { [[ "$OSTYPE" == darwin* ]]; }
is_wsl() { grep -qi microsoft /proc/version 2>/dev/null; }
path_prepend() { [[ -d "$1" && ":$PATH:" != *":$1:"* ]] && PATH="$1:$PATH"; }
path_append() { [[ -d "$1" && ":$PATH:" != *":$1:"* ]] && PATH="$PATH:$1"; }

# ---------------------------------------------------------------------------
# PATH (each entry only if it exists, and only once)
path_prepend "$HOME/bin"
path_prepend "$HOME/.local/bin"
if is_mac; then
  path_prepend /usr/local/mysql/bin
  path_prepend /Library/Frameworks/Python.framework/Versions/3.6/bin
fi
if is_wsl; then
  path_append /mnt/c/Users/sahil/AppData/Local/Programs/Devin/bin
fi
export PATH

# ---------------------------------------------------------------------------
# History: (not actually) eternal.
# - https://stackoverflow.com/questions/9457233/unlimited-bash-history
# - https://sanctum.geek.nz/arabesque/better-bash-history/
shopt -s histappend
export HISTFILESIZE=10000
export HISTSIZE=10000
# Ignore commands beginning with whitespace, and duplicates.
export HISTCONTROL=ignoreboth
export HISTIGNORE='ls:bg:fg:history'
export HISTTIMEFORMAT='%F %T '
# Some bash sessions truncate .bash_history on close, so keep a separate file.
export HISTFILE=~/.bash_long_history
# Write history after every command, so parallel terminals don't lose it.
PROMPT_COMMAND="history -a${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

# Re-check the window size after each command.
shopt -s checkwinsize

# ---------------------------------------------------------------------------
# Colours and pagers
if is_mac; then
  export CLICOLOR=1
  export LSCOLORS=GxFxCxDxBxegedabagaced
else
  [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
  if [ -x /usr/bin/dircolors ]; then
    if [ -r ~/.dircolors ]; then eval "$(dircolors -b ~/.dircolors)"; else eval "$(dircolors -b)"; fi
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
  fi
fi

# ---------------------------------------------------------------------------
# Aliases
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# ---------------------------------------------------------------------------
# Completion
if is_mac; then
  if command -v brew >/dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    . "$(brew --prefix)/etc/bash_completion"
  fi
elif ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ---------------------------------------------------------------------------
# Language version managers
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
# npm completion, generated once by install.sh (npm completion > ~/.npm-completion.bash).
[ -f ~/.npm-completion.bash ] && . ~/.npm-completion.bash
# Load RVM into a shell session *as a function*.
[ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"

# ---------------------------------------------------------------------------
# Platform extras
if is_mac; then
  [ -e "$HOME/.iterm2_shell_integration.bash" ] && . "$HOME/.iterm2_shell_integration.bash"
fi
if is_wsl; then
  # Open links in the Windows browser, and folders in the Devin desktop app.
  export BROWSER=wslview
  surf() {
    devin-desktop --folder-uri "vscode-remote://wsl+Ubuntu$(readlink -f "$1")"
  }
fi

# ---------------------------------------------------------------------------
# Prompt: Starship (https://starship.rs), config in ~/.config/starship.toml.
# Skipped when starting inside a Windows /mnt/ directory, where it is slow.
if command -v starship >/dev/null && [[ -z "$STARSHIP_SHELL" && "$PWD" != /mnt/* ]]; then
  eval "$(starship init bash)"
fi

# Start new terminals in ~/dev rather than the home folder.
if [[ "$PWD" == "$HOME" && -d ~/dev ]]; then
  cd ~/dev
fi

unset -f is_mac is_wsl path_prepend path_append
