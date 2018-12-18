function yayup {
	yay -Syu --noconfirm
}

alias yayu=yayup

function yayi {
	yay -S "$@" --noconfirm
}

alias yayin=yayi

function yayr {
	yay -Rsc "$@" --noconfirm
}

alias yayrm=yayr

function yays {
	yay -Ss "$@"
}
