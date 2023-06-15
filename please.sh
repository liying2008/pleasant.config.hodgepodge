#!/usr/bin/env bash


# 请设置 PLEASANT_DEBUG=1 以开启Debug信息显示
#export PLEASANT_DEBUG=1

DIR=$(dirname "$BASH_SOURCE")
[[ $PLEASANT_DEBUG == 1 ]] && echo $DIR

BASH_DIRS=(bash/alias bash/tool)

for subdir in ${BASH_DIRS[*]}; do
  aliasdir="$DIR/$subdir"
  if [ -d "$aliasdir" ]; then
    for i in "$aliasdir"/*.sh; do
      if [ -r $i ]; then
        [[ $PLEASANT_DEBUG == 1 ]] && echo source $i
        . $i
      fi
    done
    unset i
  fi
  unset subdir
done

# install vim config
#chmod u+x "$DIR/vim/install.sh"
#"$DIR/vim/install.sh"

unset PLEASANT_DEBUG
