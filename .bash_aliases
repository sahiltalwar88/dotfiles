# Aliases, loaded by ~/.bashrc on macOS and Linux.
alias c=clear
alias a='code .'
alias nukenode='pgrep node | xargs -n 1 kill'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Desktop notification when a long command finishes: sleep 10; alert (Linux).
command -v notify-send >/dev/null && alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
