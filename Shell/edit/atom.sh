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

function edobs {
	atom ~/OBS/home:fusion809
}

function edobsa {
	atom ~/OBS/home:fusion809:arch_extra
}

alias edoba=edobsa

function edpka {
	atom ~/GitHub/packer-arch
}
