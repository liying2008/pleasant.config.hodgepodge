#!/usr/bin/env bash

# 智能 cd 
goto() { [ -d "$1" ] && cd "$1" || cd "$(dirname "$1")"; }

# 创建一个目录并切换到该目录
mkcd() {
  mkdir -p "$@" && cd "$_";
}

# 压缩
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }
mkzip() {
  if [ -f "$1" ]; then
    zip "${1%%/}.zip" "$1"
  elif [ -d "$1" ]; then
    zip -r "${1%%/}.zip" "$1"
  fi
}

# 解压缩
ext() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjvf $1    ;;
            *.tgz)       tar xzvf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via ext()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
