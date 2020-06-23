function juliaupq {
    pushd -q $HOME/AUR/julia-git
    pkgver_original=$(cat PKGBUILD | grep ^pkgver= | cut -d '=' -f 2)
    makepkg -sifC --nocheck --noconfirm
    pkgver_new=$(cat PKGBUILD | grep ^pkgver= | cut -d '=' -f 2)
    if [[ $pkgver_original != $pkgver_new ]]; then
        push "$pkgver_original->$pkgver_new"
    fi
    popd -q
}