function openra_radot5_update_quiet {
    # OpenRA Red Alert .5 latest commit available
    pushd -q /home/fusion809/GitHub/others/"Red-Alert-.5" || return
    if ! command -v git > /dev/null 2>&1; then
        printf "git is not detected, either install it or if already installed at it to the system PATH.\n" && return
    fi
    git stash -q || return
    git fetch origin -q && git rebase origin -q || ( printf "ORAD5Err\n" && return )
    orlv=$(git rev-list --branches master --count)
    # OpenRA latest packaged version
    orpv=$(grep "VERSION" < $HOME/.local/share/openra-radot5 | cut -d ' ' -f 2)

    if ! [[ $orpv == $orlv ]]; then
        dot5up
    fi
    popd -q
}

alias dot5upq=openra_radot5_update_quiet