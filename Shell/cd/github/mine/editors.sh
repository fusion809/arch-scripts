function cded {
  cd "$GHUBM/editors/$1"
}

function cdee {
  cded "emacs/$1"
}

function cdes {
  cded "spacemacs/$1"
}

function cdev {
  cded "vim/$1"
}

alias cdvm=cdev
alias cdvim=cdev
