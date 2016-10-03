function pacaup {
	su - fusion809 -c "pacaur -Syu --noconfirm --force --needed --noedit"
}

function update {
	su - fusion809 -c "pacaur -Syu --noconfirm --force --needed --noedit && apm-bleeding update --no-confirm && vimup"
}
