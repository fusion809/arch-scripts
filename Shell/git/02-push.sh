function push {
  git add --all                                        # Add all files to git
  git commit -m "$1"                                   # Commit with message = argument 1
  git push origin $(git rev-parse --abbrev-ref HEAD)   # Push to the current branch
}

# Push GitHub pages changes
function pushp {
  git add --all
  git commit -m "$1"
  git push -u origin $(git rev-parse --abbrev-ref HEAD)
}

function pushss {
  push "$1"
  gitsh
  gitsize
}

function pushhp {
  git add --all             # Add all files to git
  git commit -m "$1"        # Commit with message = argument 1
  git push origin gh-pages  # Push to the gh-pages branch
}
