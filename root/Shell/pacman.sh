function pacin {
	pacman -S $@ --noconfirm --force --needed
}

function pacup {
	pacman -Syu --noconfirm --force --needed
}

alias update=pacup

function pacrm {
	pacman -Rsc $@ --noconfirm --force
}

function pacq {
	pacman -Qlq $1 | grep $2
}
