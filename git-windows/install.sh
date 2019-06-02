#!/usr/bin/env bash


# 请设置 PLEASANT_DEBUG=1 以开启Debug信息显示
export PLEASANT_DEBUG=1

BASE_DIR=$(cd `dirname "$0"`/..; pwd)
[[ $PLEASANT_DEBUG == 1 ]] && echo BASE_DIR=$BASE_DIR

if [ ! -f "$HOME/.bash_profile" ]; then
  cp -f "$BASE_DIR/git-windows/.bash_profile" "$HOME/.bash_profile"
fi

one_cmd="test -f $BASE_DIR/please.sh && . $BASE_DIR/please.sh"
[[ $PLEASANT_DEBUG == 1 ]] && echo one_cmd=$one_cmd

echo -e "\n#Added by pleasant.config.hodgepodge\n$one_cmd" >> "$HOME/.bash_profile"
echo "done."
