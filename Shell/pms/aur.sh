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

# git tools
function gita {
	for i in "$@"
	do
		git clone https://aur.archlinux.org/$i.git /home/fusion809/AUR/$i
	done
}

function gitaur {
	for i in "$@"
	do
		git clone ssh://aur@aur.archlinux.org/$i.git ~/AUR/$i
	done
}

function pushaur {
	if [[ -n $1 ]]; then
		mksrcinfo
		git add PKGBUILD .SRCINFO *.install
		git commit -m "$1"
		git push origin master
	else
		mksrcinfo
		git add PKGBUILD .SRCINFO *.install
		git commit -m 'Initial import'
		git push origin master
	fi
}
