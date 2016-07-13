function edapnb {
  atom-bleeding $ATO/$1
}

function edaplb {
  unset LIST
  for i in "$@"
  do
    LIST+=($ATO/$i)
  done
  atom-bleeding $LIST
}

function edapkb {
	edapl about-arch browser-plus-fix language-archlinux language-gfm2 language-ini-desktop language-patch2 language-unix-shell language-solus terminal-fusion
}

function edargmb {
  edapl language-gfm2
}

function edarpkb {
  edapnb language-archlinux
}

function edarshb {
  edapnb language-unix-shell
}

function edartfb {
  edapnb terminal-fusion
}

function edarab {
  edapnb about-arch
}
