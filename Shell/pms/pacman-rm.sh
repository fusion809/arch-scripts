# Equivalent to autoremove
function pacar {
	pacman -Qdtq | sudo pacman -Rs -
}

function pacrm {
	sudo pacman -Rs $@ --noconfirm
}

function pacrma {
	sudo pacman -Rsc $@ --noconfirm
}
