function gbash {
	gvim ~/.bashrc
}

function gvfgi {
	gvim -c ":call FGI()"
}

function gvpk {
	gvim -c ":call PKG()"
}

function gvgvim {
	gvim ~/.vimrc
}

function gvsh {
	gvim -c ":call SH()"
}

function gvzsh {
	gvim ~/.zshrc
}

function gzsh {
  gvim ~/.zshrc $SHL
}
