#export JAVA_HOME="/cygdrive/c/PROGRA~2/Java/jdk1.8.0_45"
alias ls="ls --color=auto"
alias ll="ls -la"
alias la="ls -a"
alias lh="ls -lha"
alias df="df -h"
alias du1="du --max-depth=1"
alias c="clear"
alias ..="cd .."
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias greph="history | grep"
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias ports='netstat -tulanp'
alias rm='rm -I --preserve-root'

## pass options to free ## 
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

#alias karma="cd ~/Web-Karma/karma-web;mvn -Dslf4j=false -Dlog4j.configuration=file:./config/log4j.properties jetty:run" 

export PS1="\[\e[00;37m\] \t [\[\e[0m\]\[\e[00;33m\]\w\[\e[0m\]\[\e[00;37m\]]\n\[\e[0m\]\[\e[00;35m\]\u\[\e[0m\]\[\e[01;34m\]@\[\e[0m\]\[\e[00;36m\]\h\[\e[0m\]\[\e[01;37m\]>\[\e[0m\]"

