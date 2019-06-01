#!/usr/bin/env bash


DIR=$(dirname "$0")
NOW=$(date +"%y%m%d%H%M%S")

md5() {
  md5sum "$1" | awk '{print $1}'
}

# same: return 0; else return 1
is_file_same() {
  file1="$1"
  file2="$2"
  [[ $(md5 "$file1") == $(md5 "$file2") ]]
}

# just for testing
# md5 "$DIR"/vimrc
# is_file_same "$DIR"/vimrc "$DIR"/vimrc; echo $?
# is_file_same "$DIR"/vimrc "$DIR"/vimrc.local; echo $?

copy_vimrc() {
  cp "$DIR"/vimrc "$HOME"/.vimrc
}

copy_vimrc_local() {
  cp "$DIR"/vimrc.local "$HOME"/.vimrc.local
}

# copy vimrc
if [ -f "$HOME/.vimrc" ]; then
  is_file_same "$HOME/.vimrc" "$DIR"/vimrc
  if [[ $? == 1 ]]; then
    [[ $PLEASANT_DEBUG == 1 ]] && echo "vimrc changed."
    mv "$HOME/.vimrc" "$HOME/.vimrc_$NOW"
    copy_vimrc
  fi
else
  copy_vimrc
fi

# copy vimrc.local
if [ -f "$HOME/.vimrc.local" ]; then
  is_file_same "$HOME/.vimrc.local" "$DIR"/vimrc.local
  if [[ $? == 1 ]]; then
    [[ $PLEASANT_DEBUG == 1 ]] && echo "vimrc.local changed."
    mv "$HOME/.vimrc.local" "$HOME/.vimrc.local_$NOW"
    copy_vimrc_local
  fi
else
  copy_vimrc_local
fi
