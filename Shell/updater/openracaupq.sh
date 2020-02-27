function openra_combined_arms_update_quiet {
    # OpenRA Combined Arms latest commit available
    pushd -q /home/fusion809/GitHub/others/CAmod || return

    if command -v git > /dev/null 2>&1; then
        git stash -q || return
        git pull origin master -q || ( printf "ORACAErr\n" && return )
        orlv=$(git rev-list --branches master --count)
    else
        printf "git is not detected, either install it or if already installed at it to the system PATH.\n" && return
    fi

    # Latest packaged version
    orpv=$(grep "VERSION" < $HOME/.local/share/openra-ca | cut -d ' ' -f 2)

    if ! [[ $orpv == $orlv ]]; then
        caup
    fi
    popd -q
}

alias caupq=openra_combined_arms_update_quiet