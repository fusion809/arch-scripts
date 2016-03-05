# Equivalent to autoremove
function pacar {
	pacman -Qdtq | pacman -Rs -
}

function pacup {
	sudo pacman -Syu --noconfirm --force
}

function pacin {
	sudo pacman -S $@ --noconfirm --force --needed
}

function pacrin {
	sudo pacman -S home_fusion809_Arch_Extra/$1 --noconfirm --force --needed
}

function pacrm {
	sudo pacman -Rs $@ --noconfirm
}

function pacs {
	sudo pacsearch $@
}

function pacloc {
	if [[ -n $@ ]]; then
		sudo pacman -U $@ --noconfirm --force
	else
		sudo pacman -U *.pkg.tar.xz --noconfirm
	fi
}
