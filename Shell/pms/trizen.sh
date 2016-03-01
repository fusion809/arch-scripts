function trizin {
	trizen -S $@ --noconfirm --needed
}

function trizrm {
	trizen -Rs $@ --noconfirm
}

function tup {
	trizen -Syu --noconfirm
}
