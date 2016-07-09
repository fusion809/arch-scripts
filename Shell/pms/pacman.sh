function pacup {
	sudo pacman -Syu --noconfirm --force
}

function pacin {
	sudo pacman -S $@ --noconfirm --needed
}

function pacinf {
	sudo pacman -S $@ --noconfirm --needed --force
}

function pacinr {
	sudo pacman -S $@ --noconfirm
}

function pacinrf {
	sudo pacman -S $@ --noconfirm --force
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

function pacrlib {
	unset OUTPUT
	unset FILES
	unset BASE
	OUTPUT=$(sudo pacman -S git --noconfirm --force)
	FILES=$(echo $OUTPUT | sed -n -e 's/^.*File //p' | sed -n -e 's/ is empty, not checked.//p')
	BASE=$(echo $FILES | sed -n -e 's/.so.*/.so/p')
	for i in $BASE
	do
		L=$(sudo pacman -Qo $i)
		sudo pacman -S $(echo $L | sed -n -e 's/^.*by //p' | sed -n -e 's/ .*//p') --noconfirm --force
		unset L
	done
	unset OUTPUT
	unset FILES
	OUTPUT=$(sudo pacman -S git --noconfirm --force)
	FILES=$(echo $OUTPUT | sed -n -e 's/^.*File //p' | sed -n -e 's/ is empty, not checked.//p')
	sudo rm $FILES
}

# pacman reinstall all packages
function pacrin {
	for i in $(pacman -Q | cut -d' ' -f1)
	do
		sudo pacman -S $i --noconfirm --force
	done
}
