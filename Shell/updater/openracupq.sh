function openra_raclassic_update_quiet {
    # OpenRA RAClassic latest commit available
    pushd -q /home/fusion809/GitHub/others/raclassic || return

    if command -v git > /dev/null 2>&1; then
        git stash -q || return
        git pull origin master -q || ( printf "ORACErr\n" && return )
        orlv=$(git rev-list --branches master --count)
    else
        printf "git is not detected, either install it or if already installed at it to the system PATH.\n" && return
    fi

    # Latest packaged version
    orpv=$(grep "VERSION" < $HOME/.local/share/openra-raclassic | cut -d ' ' -f 2)

    if ! [[ $orpv == $orlv ]]; then
        racup
    fi
    popd -q
}

alias racupq=openra_raclassic_update_quiet