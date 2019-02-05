# Increase file system file watch limit
ulimit -n 10000

# Git Bash Completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Pretty colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Show git status on prompt (with color codes)
alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/ (\1) /'"
export PS1='\[\033[01;31m\]\u\[\033[00m\]@\[\033[01;36m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[0;32m\]$(__git_ps1)\[\033[0;00m\]\$ '

## Alii
alias c=clear
alias a='code .'
alias nukenode='pgrep node | xargs -n 1 kill'

# ODC setup
alias ocna='bk-vpn -o -e Ashburn'
alias disc='bk-vpn -o -d'
alias soaktunnel='ssh -f "dmpsoak.bluekai.com" -L "3312:localhost:3306" -N'

## Fuck antivirus
alias stop_av='sudo /usr/local/McAfee/AntiMalware/VSControl stopoas'
alias start_av='sudo /usr/local/McAfee/AntiMalware/VSControl startoas'

# Get .bashrc first
# source ~/.bashrc
export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh

# MySQL
export PATH=/usr/local/mysql/bin:$PATH

# Manual scripts n shit
export PATH=~/bin:$PATH

# DMP Tools
export PATH=~/dev/dmp/dmptools:$PATH

# Convenience
cd dev/dmp
 
# Tomcat 
# TODO: change to wherever you unzipped tomcat
# export CATALINA_HOME=~/bin/tomcat
# export TOMCAT_HOME=$CATALINA_HOME
# export CATALINA_PID=$CATALINA_HOME/catalina_pid.txt
 
# DMP
export BKEBACKEND_DIR=~/dev/dmp/bk-service-platform
export DMP_HOST="0.0.0.0:3000"
export TOMCAT_HOST="0.0.0.0:8080"
 
# Test Superuser
 
# TODO get `SERVICE_KEY` from your colleague
# export SERVICE_KEY=<Super User Key>

# TODO get `SERVICE_PRIVATE_KEY` from your colleague
# export SERVICE_PRIVATE_KEY=<Super User Private Key>

export BLUE_KAI_API_HOST=$TOMCAT_HOST
export SERVICE_HOSTNAME=$TOMCAT_HOST
export ACL_PATH=''
export ADMIN_RELATIVE_ROOT=''
export BUYER_RELATIVE_ROOT=''
export PUBLISHER_RELATIVE_ROOT=''
export ADMIN_HOSTNAME=$DMP_HOST
export ADMIN_REPORTING_HOSTNAME='admin.dev'
export AUTH_HOSTNAME=$TOMCAT_HOST
export BUYER_HOSTNAME='buyer.dev'
export PUBLISHER_HOSTNAME='publisher.dev'
export WUNDERBAR_HOSTNAME=''
export WUNDERBAR_PATH=''
export RAILS_RELATIVE_URL_ROOT=''
export BK_THIN_APP_HOSTNAME=$DMP_HOST
export BK_THIN_APP_RELATIVE_ROOT=''
export INSIGHTS_HOSTNAME='soak-insights.bluekai.com'
export RELATED_CATEGORIES_SERVICE_HOST='api-test.bluekai.com'
export INDEX_PAGINATION_ALIQUOT=''
export ADWORDS_OAUTH2_CLIENT_ID=''
export ADWORDS_OAUTH2_CLIENT_SECRET=''
export ADWORDS_DEVELOPER_TOKEN=''
export BLUE_KAI_SERVICES_KEY=$SERVICE_KEY
export BLUE_KAI_SERVICES_PRIVATE_KEY=$SERVICE_PRIVATE_KEY
export ODC_ACCOUNT_SRV_URL="http://$TOMCAT_HOST/"
export ODC_ACCOUNT_INFO_SRV_URL="http://$TOMCAT_HOST/"
export ODC_ACCOUNT_UNLINK_SRV_URL="http://$TOMCAT_HOST/"
export ODC_CLIENT_ID='id'
export ODC_CLIENT_SECR='secret'
 
#######################
#        MYSQL        #
#######################
 
export MYSQL_USERNAME="webuser"

# TODO: change this to whatever your `webuser` password is in mySQL
# export MYSQL_PASSWORD=<Password>

export MYSQL_SLAVE_DBHOST="localhost"
export MYSQL_MASTER_DBHOST="localhost"
export MYSQL_DBPORT=3306
export MYSQL_MAX_IDLE=5
export MYSQL_MAX_WAIT=10000
export MYSQL_MAX_ACTIVE=40
export MYSQL_VALIDATION_QUERY="select 1"
export MYSQL_TEST_ON_RETURN="true"
export MYSQL_TEST_WHILE_IDLE="true"
export MYSQL_REMOVE_ABANDONED="true"
export MYSQL_LOG_ABANDONED="true"
export OracleRAC_USERNAME="dmpusr1"

# TODO: get `OracleRAC_PASSWORD` from your colleague
# export OracleRAC_PASSWORD=<Password>

export OracleRAC_DBHOST="vulcan03.wdc.bluekai.com"
export OracleRAC_DBPORT=10189
export OracleRAC_SERVICE="pdstor_query.exacad2prd.odc.oraclevcn.com"
export OracleRAC_MAX_IDLE=30
export OracleRAC_MAX_WAIT=10000
export OracleRAC_MAX_ACTIVE=40
export OracleRAC_VALIDATION_QUERY="SELECT 1 FROM DUAL"
export OracleRAC_TEST_ON_RETURN="true"
export OracleRAC_TEST_WHILE_IDLE="true"
export OracleRAC_REMOVE_ABANDONED="true"
export OracleRAC_LOG_ABANDONED="true"
export RevDB_USERNAME="ORACLEBKDMPUSER01"

# TODO: get `RevDB_PASSWORD` from your colleague
# export RevDB_PASSWORD=<Password>

export RevDB_DBHOST="revproddb01.wdc.bluekai.com"
export RevDB_DBPORT=40000
export RevDB_SERVICE="revprd01.wdc.bluekai.com"
export RevDB_MAX_IDLE=30
export RevDB_MAX_WAIT=10000
export RevDB_MAX_ACTIVE=40
export RevDB_VALIDATION_QUERY="SELECT 1 FROM DUAL"
export RevDB_TEST_ON_RETURN="true"
export RevDB_TEST_WHILE_IDLE="true"
export RevDB_REMOVE_ABANDONED="true"
export RevDB_LOG_ABANDONED="true"
 
#######################
#        REDIS        #
#######################
 
export REDIS_KNOWN_SENTINEL='127.0.0.1'
export REDIS_PORT=4444

# TODO: get `REDIS_AUTH_PASSWORD` from your colleague
# export REDIS_AUTH_PASSWORD=<Password>

alias redis-beta-login='ssh -f dmpbeta4.bluekai.com -L 4444:10.124.32.136:6379 -N;'
 
#######################
#  LOCAL DMP-SERVICES #
#######################
 
export JPDA_ADDRESS=1043
export JPDA_TRANSPORT=dt_socket
export JAVA_OPTS="${JAVA_OPTS} -Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n"

# Add node modules to path in env/dev
export PATH=$PATH:./node_modules/.bin
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

###-begin-npm-completion-###
# npm command completion script
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
