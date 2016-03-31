function push {
  git add --all && git commit -m "$1" && git push origin master
}

# Push GitHub pages changes
function pushp {
  git add --all && git commit -m "$1" && git push -u origin master
}

function pushss {
  push "$1" && gitsh && gitsize
}
