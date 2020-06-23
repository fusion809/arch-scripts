function juliaupq {
    pushd -q $HOME/AUR/julia-git
    hash_package=$(cat PKGBUILD | grep ^pkgver= | cut -d '.' -f 6 | sed 's/[a-z0-9]$//g')
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