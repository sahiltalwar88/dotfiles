# ~/.bash_profile: macOS login shells (every new Terminal or iTerm window).
# Only login-time settings live here; everything else is in ~/.bashrc.
# Linux doesn't use this file: Ubuntu's ~/.profile loads ~/.bashrc instead,
# and a ~/.bash_profile there would stop ~/.profile from running.

# Raise the open-file limit (file watchers in big JS projects need it).
ulimit -n 10000

[ -f ~/.bashrc ] && . ~/.bashrc
