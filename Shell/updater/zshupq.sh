function zsh_update_quiet {
    pkgver=$(curl -sL https://github.com/zsh-users/zsh/releases | grep "[a-z]*-.*\.tar\.gz" | head -n 1 | cut -d "/" -f 5 | cut -d '-' -f 2 | sed 's/\.tar.*//g')
    pkgpver=$(cat /home/fusion809/OBS/home:fusion809/zsh/zsh.spec | grep Version | cut -d ' ' -f 2)

    if ! [[ $pkgver == $pkgpver ]]; then
        zshup
    fi
}

alias zshupq=zsh_update_quiet