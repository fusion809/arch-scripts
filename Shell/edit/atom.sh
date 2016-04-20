# bash
function abash {
	atom ~/.bashrc $SHL
}

# zsh
function azsh {
  atom ~/.bashrc $SHL
}

# atom
function edat {
	atom ~/.atom
}

# archiso
function edai {
	atom $GHUBM/archiso
}

# bin
function edbin {
	atom ~/bin
}

alias edin=edbin
alias ebin=edbin

# Menus
function edmen {
	sudo atom /etc/xdg/menus && sudo atom /usr/share/desktop-directories
}

# PKGBUILDs
function edpk {
	atom $GHUBM/PKGBUILDs
}

# Python scripts
function edpy {
	atom $GHUBM/python-scripts
}

# Shell scripts
function edsh {
	atom $SHL
}

function edau {
	atom ~/AUR
}

function edpka {
	atom $GHUBM/packer-arch
}

function edzp {
	atom ~/.oh-my-zsh/plugins
}

function edzt {
	atom ~/.oh-my-zsh/themes/
}

# NPM
function ednpm {
	atom $GHUBM/npm2archOBS
}

function edhp {
	atom $GHUBM/hubpress.io
}

function edjs {
	atom $GHUBM/JScripts
}
