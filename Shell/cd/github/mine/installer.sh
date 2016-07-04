# Installers
function cdins {
	cd $INS/$1
}

alias cdgi=cdins
alias cdgmi=cdins

# My Atom Installer repo
function cdatin {
	cdins atom-installer/$1
}

function cdltin {
	cdins brackets-installer/$1
}

function cdltin {
	cdins lighttable-installer/$1
}

function cdvsi {
	cdins vscode-installer/$1
}
