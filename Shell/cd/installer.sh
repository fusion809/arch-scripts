# Installers
function cdins {
	cd $INS/$1
}

alias cdgi=cdins
alias cdgmi=cdins

# My Atom Installer repo
function cdatin {
	cdins atom-installer
}

function cdvsi {
	cdins vscode-installer
}
