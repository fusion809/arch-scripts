function openra_generals_alpha_update_quiet {
    # OpenRA Generals Alpha latest commit available
    pushd -q /home/fusion809/GitHub/others/Generals-Alpha || return
    if ! command -v git > /dev/null 2>&1; then
        printf "git is not detected, either install it or if already installed at it to the system PATH.\n" && return
    fi
    git stash -q || return
    git pull origin master -q || ( printf "ORAGAErr\n" && return )
    orlv=$(git rev-list --branches master --count)
    # OpenRA latest packaged version
    orpv=$(grep "VERSION" < $HOME/.local/share/openra-gen | cut -d ' ' -f 2)

    if ! [[ $orpv == $orlv ]]; then
        genup
    fi
    popd -q
}

alias genupq=openra_generals_alpha_update_quiet