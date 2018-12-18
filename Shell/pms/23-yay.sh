function yayup {
	yay -Syu --noconfirm
}

function yayi {
	yay -S "$@" --noconfirm
}

alias yayin=yayi

function yayr {
	yay -Rsc "$@" --noconfirm
}

alias yayrm=yayr
