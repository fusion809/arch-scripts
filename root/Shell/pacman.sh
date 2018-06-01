function pacin {
	pacman -S $@ --noconfirm --overwrite --needed
}

function pacup {
	pacman -Syu --noconfirm --overwrite --needed
}

alias update=pacup

function pacrm {
	pacman -Rsc $@ --noconfirm
}

function pacq {
	pacman -Qlq $1 | grep $2
}

function pacs {
	pacman -Ss "$@"
}
