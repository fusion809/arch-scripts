function juliaupq {
    pushd -q $HOME/AUR/julia-git
    hash_package=$(cat PKGBUILD | grep ^pkgver= | cut -d '.' -f 6 | sed 's/[a-z0-9]$//g')
    git -C $GHUBO/julia pull origin master -q
    hash_upstream=$(git -C $GHUBO/julia rev-parse --short HEAD | sed 's/^/g/g')
    if [[ $hash_package != $hash_upstream ]]; then
        pkgver_package=$(cat PKGBUILD | grep ^pkgver= | cut -d '=' -f 2)
        rm *.pkg.tar.xz
        makepkg -siC --nocheck --noconfirm
        pkgver_upstream=$(cat PKGBUILD | grep ^pkgver= | cut -d '=' -f 2)
        push "${pkgver_package}->${pkgver_upstream}"
    fi
    popd -q
}

function juliaup {
	pkgver=$(cat $HOME/AUR/julia-git/PKGBUILD | grep ^pkgver= | cut -d '=' -f 2)
    cda julia-git/src/julia
	git pull origin master
	ver=$(git show makepkg:VERSION | sed 's/-/./g')
	pkgver_git=$(printf "%s.r%s.g%s" $(echo $ver) "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
    if ! [[ $pkgver == $pkgver_git ]]; then
		cda julia-git
		makepkg -sifC --nocheck --noconfirm
	fi
}
