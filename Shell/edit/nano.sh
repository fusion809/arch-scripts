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

# zshrc
function nzsh {
  nano $HOME/.zshrc
}
