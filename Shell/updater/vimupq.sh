function vim_update_quiet {
    pushd -q /home/fusion809/AUR/gvim-gtk2
    pkgver=$(wget -q https://github.com/vim/vim/releases -O - | grep "tar\.gz" | head -n 1 | cut -d '/' -f 5 | cut -d '"' -f 1 | sed 's/v//g' | sed 's/\.tar\.gz//g')
    existing_pkgver=$(grep "^pkgver=" < PKGBUILD | cut -d '=' -f 2)

    if ! [ $pkgver == $existing_pkgver ]; then
        vimup
    fi
    popd -q
}

alias vimupq=vim_update_quiet
