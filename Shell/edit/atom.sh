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
	atom $GHUB/archiso
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
	atom $GHUB/PKGBUILDs
}

# Python scripts
function edpy {
	atom $GHUB/python-scripts
}

# Shell scripts
function edsh {
	atom $SHL
}

function edau {
	atom ~/AUR
}

function edpka {
	atom $GHUB/packer-arch
}

function edzp {
	atom ~/.oh-my-zsh/plugins
}

function edzt {
	atom ~/.oh-my-zsh/themes/
}

# NPM
function ednpm {
	atom $GHUB/npm2archOBS
}

function edhs {
	atom $GHUB/hexo-site
}

function edhp {
	atom $GHUB/hubpress.io
}

function edjs {
	atom $GHUB/JScripts
}
