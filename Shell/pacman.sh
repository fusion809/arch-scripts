function pacup {
	sudo pacman -Syu --noconfirm --force
}

function pacin {
	sudo pacman -S $@ --noconfirm --force --needed
}

function pacrm {
	sudo pacman -Rsc $@ --noconfirm
}

function pacs {
	sudo pacsearch $@
}
