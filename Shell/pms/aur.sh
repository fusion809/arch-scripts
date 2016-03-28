function cppk {
	cp -a ~/GitHub/PKGBUILDs/${PWD##*/}/{PKGBUILD,*.install,*.patch,*.h} ~/AUR/${PWD##*/}
}

function cpau {
	cp -a ~/AUR/${PWD##*/}/{PKGBUILD,*.install} ~/GitHub/PKGBUILDs/${PWD##*/}/
}

function getaur {
	for i in "$@"
	do
		wget -cqO- https://aur.archlinux.org/cgit/aur.git/snapshot/$i.tar.gz | tar -xz
	done
}

function curlaur {
	for i in "$@"
	do
		curl https://aur.archlinux.org/cgit/aur.git/snapshot/$i.tar.gz | tar -xz
	done
}
