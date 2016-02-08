# Increase file system file watch limit
ulimit -n 10000

# Git Bash Completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

## Alii
alias c=clear
alias a='atom .'
alias watch='npm run gulp watch'

# LX setup
. ~/env/.lxprofile

# Convenience
cd env/dev

# Add node modules to path in env/dev
export PATH=./node_modules/.bin:$PATH

#use Node v4.2.2
nvm use v4.2.2
