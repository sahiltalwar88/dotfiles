# (Not actually) Eternal bash history.
# ---------------------
# Customized from:
# - https://stackoverflow.com/questions/9457233/unlimited-bash-history
# - https://sanctum.geek.nz/arabesque/better-bash-history/.
export HISTFILESIZE=10000
export HISTSIZE=10000

# Ignore commands beginning with whitespace and duplicated commands
export HISTCONTROL=ignoreboth

# Ignore ls, bg, fg, and calls to history - reasoning in the 2nd link up top
export HISTIGNORE='ls:bg:fg:history'

# Show full date
export HISTTIMEFORMAT='%F %T '

# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_long_history

# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a"
