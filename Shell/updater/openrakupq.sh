function openra_kknd_update_quiet {
    # OpenRA KKnD latest commit available
    pushd -q /home/fusion809/GitHub/others/KKnD || return
    if ! command -v git > /dev/null 2>&1; then
        printf "git is not detected, either install it or if already installed at it to the system PATH.\n" && return
    fi
    git stash -q || return
    git pull origin master -q || ( printf "ORAKDErr\n" && return )
    orlv=$(git rev-list --branches master --count)
    # OpenRA latest packaged version
    orpv=$(grep "VERSION" < $HOME/.local/share/openra-kknd | cut -d ' ' -f 2)

    if ! [[ $orpv == $orlv ]]; then
        kkndup
    fi
    popd -q
}

alias kkndupq=openra_kknd_update_quiet