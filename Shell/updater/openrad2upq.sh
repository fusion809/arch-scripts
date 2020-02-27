function openra_d2_update_quiet {
    # OpenRA Red Alert 2 mod latest commit available
    pushd -q /home/fusion809/GitHub/others/d2 || return

    if ! command -v git > /dev/null 2>&1; then
        printf "git is not detected, please install it and if already installed add it to your system PATH!\n" && return
    fi
    git stash -q || return
    git pull origin master -q || ( printf "ORAD2Err\n" && return )
    orlv=$(git rev-list --branches master --count)
    commitl=$(git log | head -n 1 | cut -d ' ' -f 2)
    # OpenRA latest packaged version
    orpv=$(grep "VERSION" < $HOME/.local/share/openra-d2 | cut -d ' ' -f 2)

    if ! [[ $orpv == $orlv ]]; then
        d2up
    fi
    popd -q
}

alias d2upq=openra_d2_update_quiet