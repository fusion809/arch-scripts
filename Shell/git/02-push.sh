function push {
  git add --all && git commit -m "$1" && git push origin $(git rev-parse --abbrev-ref HEAD)
}

# Push GitHub pages changes
function pushp {
  git add --all && git commit -m "$1" && git push -u origin master
}

function pushss {
  push "$1" && gitsh && gitsize
}

function pushhp {
  git add --all && git commit -m "$1" && git push origin gh-pages
}
