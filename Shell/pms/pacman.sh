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
