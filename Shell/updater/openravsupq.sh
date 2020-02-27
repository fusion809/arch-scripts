function openra_valiant_shades_update_quiet {
    # OpenRA Valiant Shades latest commit available
    pushd -q /home/fusion809/GitHub/others/ValiantShades || return
    if ! command -v git > /dev/null 2>&1; then
        printf "git is not detected, either install it or if already installed at it to the system PATH.\n" && return
    fi
    git stash -q || return
    git fetch origin -q && git rebase origin -q || ( printf "ORAVSErr\n" && return )
    orlv=$(git rev-list --branches master --count)
    # latest packaged version
    orpv=$(grep "VERSION" < $HOME/.local/share/openra-vs | cut -d ' ' -f 2)

    if ! [[ $orpv == $orlv ]]; then
        vsup
    fi
    popd -q
}

alias vsupq=openra_valiant_shades_update_quiet