function notepadqq_update_quiet {
    pushd -q /home/fusion809/OBS/home:fusion809/notepadqq || return
    pkgver=$(wget -q https://github.com/notepadqq/notepadqq/releases -O - | grep -v "beta" | grep "\.tar\.gz" | head -n 1 | cut -d '/' -f 5 | cut -d '"' -f 1 | sed 's/v//g' | sed 's/\.tar\.gz//g')
    pkgpver=$(cat _service | grep gz | cut -d '/' -f 4 | head -n 1 | sed 's/v//g' | sed 's/\.tar\.gz//g' | cut -d '<' -f 1)

    if ! [[ $pkgver == $pkgpver ]]; then
        notepadqqup
    fi
    popd -q
}

alias noteupq=notepadqq_update_quiet