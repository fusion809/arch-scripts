function openra_medieval_warfare_update_quiet {
    # OpenRA Medieval Warfare latest commit available
    pushd -q /home/fusion809/GitHub/others/Medieval-Warfare || return
    if ! command -v git > /dev/null 2>&1; then
        printf "git is not detected, either install it or if already installed at it to the system PATH.\n" && return
    fi
    git stash -q || return
    git pull origin Next -q || ( printf "ORAMWErr\n" && return )
    orlv=$(git rev-list --branches Next --count)
    # latest packaged version
    orpv=$(grep "VERSION" < $HOME/.local/share/openra-mw | cut -d ' ' -f 2)

    if ! [[ $orpv == $orlv ]]; then
        mwup
    fi
    popd -q
}

alias mwupq=openra_medieval_warfare_update_quiet