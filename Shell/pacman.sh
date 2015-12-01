function pacup {
	sudo pacman -Syu --noconfirm
}

function pacin {
	sudo pacman -S $@ --noconfirm
}

function pacrm {
	sudo pacman -Rsc $@ --noconfirm
}
