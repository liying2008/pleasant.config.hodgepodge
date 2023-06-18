# gprefs means git push to refs-for branch.
# Usage:
# - gprefs <remote> <branch> , e.g. `gprefs origin master` .
# - gprefs <branch> , e.g. `gprefs master` , it will detecte remote automatically.
gprefs() {
  if [ $# -gt 2 ]; then
    echo "ERROR: Too many parameters."
    exit 1
  elif [ $# -eq 2 ]; then
    local remote="$1"
    local branch="$2"
    [[ $PLEASANT_DEBUG == 1 ]] && echo "Executing: git push $remote $branch:refs/for/$branch"
    git push "$remote" "$branch":refs/for/"$branch"
  elif [ $# -eq 1 ]; then
    local remote_num=$(git remote | wc -l)
    if [ "$remote_num" -gt 1 ]; then
      echo "ERROR: Two parameters are required, remote and branch."
      exit 1
    elif [ "$remote_num" -eq 1 ]; then
      local remote=$(git remote)
      local branch="$1"
      [[ $PLEASANT_DEBUG == 1 ]] && echo "Executing: git push $remote $branch:refs/for/$branch"
      git push "$remote" "$branch":refs/for/"$branch"
    else
      echo "ERROR: No remote added to the local repository."
      exit 1
    fi
  else
    echo "ERROR: Missing parameters."
    exit 1
  fi
}

# gprefsorigin is like gprefs, except that the remote is fixed to origin.
# Usage:
# - gprefsorigin <branch> , e.g. `gprefsorigin master` .
gprefsorigin() {
  if [ $# -gt 1 ]; then
    echo "ERROR: Too many parameters."
    exit 1
  elif [ $# -eq 1 ]; then
    local branch="$1"
    [[ $PLEASANT_DEBUG == 1 ]] && echo "Executing: git push origin $branch:refs/for/$branch"
    git push origin "$branch":refs/for/"$branch"
  else
    echo "ERROR: Missing branch parameter."
    exit 1
  fi
}

# autogprefs is like gprefs, except that the current branch is automatically detected.
# Usage:
# - autogprefs <remote> <branch> , e.g. `autogprefs origin master` .
# - autogprefs <branch> , e.g. `autogprefs master` , it will detecte remote automatically.
# - autogprefs, e.g. `autogprefs` , it will detecte remote and current branch automatically.
autogprefs() {
  if [ $# -gt 0 ]; then
    gprefs "$@"
  else
    local remote=
    local remote_num=$(git remote | wc -l)
    if [ "$remote_num" -eq 1 ]; then
      remote=$(git remote)
    fi

    local branch=
    local branch_num=$(git branch --no-color --show-current --no-abbrev | wc -l)
    if [ "$branch_num" -eq 1 ]; then
      branch=$(git branch --no-color --show-current --no-abbrev)
    fi

    if [[ -n "$remote" && -n "$branch" ]]; then
      gprefs "$remote" "$branch"
    elif [[ -n "$remote" ]]; then
      # The current branch is not detected
      echo "ERROR: The branch is not detected and needs to be specified by the parameter."
      exit 1
    else
      echo "ERROR: Two parameters are required, remote and branch."
      exit 1
    fi
  fi
}

# autogprefsorigin is like gprefs, except that the remote is fixed to origin and the current branch is automatically detected.
# Usage:
# - autogprefsorigin <branch> , e.g. `autogprefsorigin master` .
# - autogprefsorigin, e.g. `autogprefsorigin` , it will detecte current branch automatically.
autogprefsorigin() {
  if [ $# -gt 0 ]; then
    gprefsorigin "$@"
  else
    local branch=
    local branch_num=$(git branch --no-color --show-current --no-abbrev | wc -l)
    if [ "$branch_num" -eq 1 ]; then
      branch=$(git branch --no-color --show-current --no-abbrev)
    fi

    if [[ -n "$branch" ]]; then
      gprefsorigin "$branch"
    else
      # The current branch is not detected
      echo "ERROR: The branch is not detected and needs to be specified by the parameter."
      exit 1
  fi
}
