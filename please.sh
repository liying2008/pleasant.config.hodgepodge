#!/usr/bin/env bash


DIR=$(dirname "$BASH_SOURCE")
#echo $DIR

BASH_DIRS=(bash/alias bash/tool)

for subdir in ${BASH_DIRS[*]}; do 
  aliasdir="$DIR/$subdir"
  if [ -d "$aliasdir" ]; then
    for i in "$aliasdir"/*.sh; do
      if [ -r $i ]; then
        echo source $i
        . $i
      fi
    done
    unset i
  fi
  unset subdir
done
