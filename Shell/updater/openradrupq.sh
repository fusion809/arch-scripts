function openra_darkreign_update_quiet {
    # OpenRA Dark Reign latest commit available
    pushd -q /home/fusion809/GitHub/others/DarkReign || return

    if ! command -v git > /dev/null 2>&1; then
        printf "git is not detected, either install it or if already installed at it to the system PATH.\n" && return
    fi
    git stash -q || return
    git pull origin master -q || ( printf "ORADRErr\n" && return )
    orlv=$(git rev-list --branches master --count)
    # OpenRA latest packaged version
    orpv=$(grep "VERSION" < $HOME/.local/share/openra-dr | cut -d ' ' -f 2)

    if ! [[ $orpv == $orlv ]]; then
        drup
    fi
    popd -q
}

alias drupq=openra_darkreign_update_quiet