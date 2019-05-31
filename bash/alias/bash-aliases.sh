#!/usr/bin/env bash

# 天气查询
alias wttr='curl wttr.in/?lang=zh'

alias vi='vim'
alias chux='chmod u+x'

alias grep='grep -E --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias wl='wc -l'
alias cls='clear'
alias now='date +"%Y-%m-%d %T"'
alias df='df -h'
alias du='du -h'
alias dush='du -sh'
alias du0='du -h --max-depth=0'
alias du1='du -h --max-depth=1'

alias last='last -a'
alias free='free -m'
alias psg='ps -aux | grep'

alias dfind='find -type d -name'  #查找文件夹
alias ffind='find -type f -name'  #查找文件

# chdir
alias vf='cd'
alias ..='cd ../'
alias cdd='cd ../'
alias cd..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias -- -='cd -'
alias cds='echo "`pwd`" > ~/.cdsave'  #cd save : save where i am
alias cdb='cd "`cat ~/.cdsave`"'  # cd back

# net
alias ping='ping -c 4'
alias port='netstat -tulanp'
alias myip='curl ifconfig.me'