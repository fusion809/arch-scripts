pkgver=$(cat /data/AUR/gvim-gtk2/PKGBUILD | grep "^pkgver" | sed 's/^pkgver=//g')
pkgverupst=$(wget -q https://github.com/vim/vim/tags -O - | grep "tar\.gz" | head -n 1 | cut -d '/' -f 7 | cut -d '"' -f 1 | sed 's/v//g' | sed 's/\.tar\.gz//g')
if ( [[ $pkgver != $pkgverupst ]] && [[ -n $pkgverupst ]] ); then
	echo "Vim $pkgverupst is available; run vimup to update gvim-gtk2 to this version"
fi

function vimup {
	cda gvim-gtk2
	pkgver=$(cat PKGBUILD | grep "^pkgver" | sed 's/^pkgver=//g')
	pkgverupst=$(wget -q https://github.com/vim/vim/tags -O - | grep "tar\.gz" | head -n 1 | cut -d '/' -f 7 | cut -d '"' -f 1 | sed 's/v//g' | sed 's/\.tar\.gz//g')
	if [[ $pkgver == $pkgverupst ]] || [[ -z $pkgverupst ]]; then
		return 1
	fi
	sed -i -e "s/$pkgver/$pkgverupst/g" PKGBUILD
	updpkgsums
	makepkg -sifC --noconfirm
	rm *.xz *.gz *.zst *.pkg.tar*
	push "$pkgver->$pkgverupst"
}
