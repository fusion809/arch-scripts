function vimup {
	cda gvim-gtk2
	pkgver=$(cat PKGBUILD | grep "^pkgver" | sed 's/^pkgver=//g')
	pkgverupst=$(wget -q https://github.com/vim/vim/tags -O - | grep "tar\.gz" | head -n 1 | cut -d '/' -f 7 | cut -d '"' -f 1 | sed 's/v//g' | sed 's/\.tar\.gz//g')
	if [[ $pkgver == $pkgverupst ]]; then
		return 1
	fi
	sed -i -e "s/$pkgver/$pkgverupst/g" PKGBUILD
	updpkgsums
	makepkg -sifC --noconfirm
	rm *.xz *.gz *.zst *.pkg.tar*
	push "$pkgver->$pkgverupst"
}
