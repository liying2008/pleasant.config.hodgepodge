# gprefs means git push to refs-for branch. For example: gprefs master
gprefs() {
  if [ -z "$1" ]; then
    echo "error: branch name required."
    return 1
  fi
  local remote=$(git remote)
  git push "$remote" "$1":refs/for/"$1"
}

# autogprefs is like gprefs, except that the current branch is automatically used
autogprefs() {
  local remote=$(git remote)
  local branch=$(git branch --no-color --show-current --no-abbrev)
  [[ $PLEASANT_DEBUG == 1 ]] && echo branch is: $branch
  git push "$remote" "$branch":refs/for/"$branch"
}
