function edapk {
	atom $ATO/about-arch $ATO/language-archlinux $ATO/language-ini-desktop $ATO/language-patch2 $ATO/language-shellscript
}

function edapn {
  atom $ATO/$1
}

function edapl {
  LIST=$(for i in "$@"; do $ATO/$i \; done)
  atom $LIST
}
