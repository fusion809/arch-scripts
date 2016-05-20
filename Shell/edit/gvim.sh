function gbash {
	gvim $HOME/.bashrc
}

function gvfgi {
	gvim -c ":call FGI()"
}

function gvpk {
	gvim -c ":call PKG()"
}

function gvgvim {
	gvim $HOME/.vimrc
}

function gvsh {
	gvim -c ":call SH()"
}

function gvzsh {
	gvim $HOME/.zshrc
}

function gzsh {
  gvim $HOME/.zshrc $SHL
}
