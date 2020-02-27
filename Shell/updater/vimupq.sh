function vim_update_quiet {
    pushd -q /home/fusion809/OBS/home:fusion809/vim
    pkgver=$(wget -q https://github.com/vim/vim/releases -O - | grep "tar\.gz" | head -n 1 | cut -d '/' -f 5 | cut -d '"' -f 1 | sed 's/v//g' | sed 's/\.tar\.gz//g')
    baseversion=$(echo $pkgver | sed 's/\.[0-9]*$//g')
    patchversion=$(echo $pkgver | sed "s/$baseversion//g" | sed 's/\.//g')
    vim_baseversion=$(cat vim.spec | grep "%define.*baseversion" | sed 's/%define.*baseversion\s*//g' | head -n 1)
    vim_patchversion=$(cat vim.spec | grep "%define.*patchlevel" | sed 's/%define.*patchlevel\s*//g' | head -n 1)

    if ! [ $pkgver == ${vim_baseversion}.${vim_patchversion} ]; then
        vimup
    fi
    popd -q
}

alias vimupq=vim_update_quiet