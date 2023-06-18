#!/usr/bin/env bash


# 请设置 PLEASANT_DEBUG=1 以开启Debug信息显示
export PLEASANT_DEBUG=1

BASE_DIR=$(cd `dirname "$0"`/..; pwd)
[[ $PLEASANT_DEBUG == 1 ]] && echo BASE_DIR=$BASE_DIR

STARTUP_FILE=

if [ -f "$HOME/.bash_profile" ]; then
  STARTUP_FILE="$HOME/.bash_profile"
elif [ -f "$HOME/.profile" ]; then
  STARTUP_FILE="$HOME/.profile"
elif [ -f "$HOME/.bashrc" ]; then
  STARTUP_FILE="$HOME/.bashrc"
else
  echo "ERROR: Unable to install because the user startup profile was not found."
  exit 1
fi

run_cmd="test -f $BASE_DIR/please.sh && . $BASE_DIR/please.sh"
[[ $PLEASANT_DEBUG == 1 ]] && echo "Add run cmd: $run_cmd"

echo -e "\n#Added by pleasant.config.hodgepodge\n$run_cmd" >> "$STARTUP_FILE"

echo "Installation completed! Need to reload this session."
