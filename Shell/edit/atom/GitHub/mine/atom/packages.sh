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
	edapl about browser-plus-fix language-archlinux language-gfm2 language-ini-desktop language-patch2 language-shellscript language-solus terminal-fusion
}

function edargm {
  edapl language-gfm2
}

function edarpk {
  edapn language-archlinux
}

function edarsh {
  edapn language-shellscript
}

function edartf {
  edapn terminal-fusion
}
