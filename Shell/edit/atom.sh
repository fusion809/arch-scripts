# bash
function abash {
	atom ~/.bashrc ~/Shell
}

# zsh
function azsh {
  atom ~/.bashrc ~/Shell
}

# atom
function edat {
	atom ~/.atom
}

# archiso
function edai {
	atom ~/GitHub/archiso
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
	atom ~/GitHub/PKGBUILDs
}

# Python scripts
function edpy {
	atom ~/GitHub/python-scripts
}

# Shell scripts
function edsh {
	atom ~/Shell
}

function edau {
	atom ~/AUR
}

function edpka {
	atom ~/GitHub/packer-arch
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

function edhp {
	atom $GHUB/hubpress.io
}

function edjs {
	atom $GHUB/JScripts
}
