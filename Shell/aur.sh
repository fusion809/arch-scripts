function cppk {
	cp -a ~/GitHub/PKGBUILDs/${PWD##*/}/{PKGBUILD,*.install,*.patch,*.h} ~/AUR/${PWD##*/}
}
