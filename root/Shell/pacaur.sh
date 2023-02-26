function pacaup {
	su - fusion809 -c "yay -Syu --noconfirm --overwrite --needed"
}

function update {
	su - fusion809 -c "yay -Syu --noconfirm --overwrite --needed && apm-bleeding update --no-confirm && vimup"
}

function pacain {
	su - fusion809 -c "yay -S $@ --noconfirm --overwrite --needed"
}

function pacas {
	su - fusion809 -c "yay -Ss $@"
}
