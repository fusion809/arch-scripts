# bashrc
function nbash {
	nano $HOME/.bashrc
}

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

function npk {
	if [[ -f PKGBUILD ]]; then
		nano PKGBUILD
	elif [[ -f package.json ]]; then
		nano package.json
	else
		printf "No PKGBUILD or package.json found in $PWD!"
	fi
}

function ngit {
	nano .gitignore
}
