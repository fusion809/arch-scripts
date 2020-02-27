function openra_romanovs_vengeance_update_quiet {
    # OpenRA Romanov's Vengeance latest commit available
    pushd -q /home/fusion809/GitHub/others/Romanovs-Vengeance || return
    if ! command -v git > /dev/null 2>&1; then
        printf "git is not detected, either install it or if already installed at it to the system PATH.\n" && return
    fi
    git stash -q || return
    git fetch origin -q && git rebase origin -q || ( printf "ORARVErr\n" && return )
    orlv=$(git rev-list --branches master --count)
    # latest packaged version
    orpv=$(grep "VERSION" < $HOME/.local/share/openra-rv | cut -d ' ' -f 2)

    if ! [[ $orpv == $orlv ]]; then
        rvup
    fi
    popd -q
}

alias rvupq=openra_romanovs_vengeance_update_quiet