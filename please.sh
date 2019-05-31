#!/usr/bin/env bash


DIR=$(dirname "$BASH_SOURCE")
#echo $DIR

# souce bash/alias/*.sh
aliasdir="$DIR/bash/alias"
if [ -d "$aliasdir" ]; then
  for i in "$aliasdir"/*.sh; do
    if [ -r $i ]; then
      echo source $i
      . $i
    fi
  done
  unset i
fi

# souce bash/tool/*.sh
tooldir="$DIR/bash/tool"
if [ -d "$tooldir" ]; then
  for i in "$tooldir"/*.sh; do
    if [ -r $i ]; then
      echo source $i
      . $i
    fi
  done
  unset i
fi
