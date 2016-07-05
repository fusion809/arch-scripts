# bashrc
function nbash {
	nano $HOME/.bashrc
}

# emacs config
function nem {
	nano $HOME/.emacs
}

# gitignore
function ngit {
	nano .gitignore
}

function npc {
	sudo nano /etc/pacman.conf
}

# PKGBUILD/package.json
function npk {
	if [[ -f PKGBUILD ]]; then
		nano PKGBUILD
	elif [[ -f package.json ]]; then
		nano package.json
	else
		printf "No PKGBUILD or package.json found in $PWD!"
	fi
}

# spacemacs config
function nsp {
	nano $HOME/.spacemacs
}

# xinitrc
function nx {
	nano $HOME/.xinitrc
}

# vimrc - navim is what it should be called it nvim is installed
if ! [[ -f /usr/bin/nvim ]]; then
	function nvim {
		nano $HOME/.vimrc
	}
else
	function navim {
		nano $HOME/.vimrc
	}
fi

# zshrc
function nzsh {
  nano $HOME/.zshrc
}
