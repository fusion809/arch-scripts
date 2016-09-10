function clipf {
	xclip -sel clip < $1
}

function descf {
	cat PKGBUILD | grep "pkgdesc=" | sed 's/pkgdesc=//g' | sed "s/'//g" | xclip -i
}
