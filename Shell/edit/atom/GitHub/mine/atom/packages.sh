function edapn {
  atom $ATO/$1
}

function edapl {
  unset LIST
  for i in "$@"
  do
    LIST+=($ATO/$i)
  done
  atom $LIST
}

function edapk {
	edapl about-arch browser-plus-fix language-archlinux language-gfm2 language-ini-desktop language-patch2 language-unix-shell language-solus terminal-fusion
}

function edargm {
  edapl language-gfm2
}

function edarpk {
  edapn language-archlinux
}

function edarsh {
  edapn language-unix-shell
}

function edartf {
  edapn terminal-fusion
}

function edara {
  edapn about-arch
}
