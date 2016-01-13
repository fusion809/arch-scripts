function pacin {
	pacman -S $@ --noconfirm --force
}

function pacup {
	pacman -Syu --noconfirm --force
}

alias update=pacup

function pacrm {
	pacman -Rsc $@ --noconfirm --force
}

function pacq {
	pacman -Qlq $1 | grep $2
}
