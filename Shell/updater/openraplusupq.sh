function openra_raplus_update_quiet {
    # OpenRA Red Alert plus latest commit available
    pushd -q /home/fusion809/GitHub/others/raplusmod|| return
    if ! command -v git > /dev/null 2>&1; then
        printf "git is not detected, either install it or if already installed at it to the system PATH.\n" && return
    fi
    git stash -q || return
    git fetch origin -q && git rebase origin -q || ( printf "ORARA+Err\n" && return )
    orlv=$(git rev-list --branches master --count)
    # latest packaged version
    orpv=$(grep "VERSION" < $HOME/.local/share/openra-raplus | cut -d ' ' -f 2)

    if ! [[ $orpv == $orlv ]]; then
        raplusup
    fi
    popd -q
}

alias raplusupq=openra_raplus_update_quiet