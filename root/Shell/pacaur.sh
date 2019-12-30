function pacaup {
	su - fusion809 -c "yay -Syu --noconfirm --overwrite --needed --noedit"
}

function update {
	su - fusion809 -c "yay -Syu --noconfirm --overwrite --needed --noedit && apm-bleeding update --no-confirm && vimup"
}

function pacain {
	su - fusion809 -c "yay -S $@ --noconfirm --overwrite --needed --noedit"
}

function pacas {
	su - fusion809 -c "yay -Ss $@"
}
