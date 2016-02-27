function cppk {
	cp -a ~/GitHub/PKGBUILDs/${PWD##*/}/{PKGBUILD,*.install,*.patch,*.h} ~/AUR/${PWD##*/}
}

function cpau {
	cp -a ~/AUR/${PWD##*/}/{PKGBUILD,*.install} ~/GitHub/PKGBUILDs/${PWD##*/}/
}
