function openra_yuris_revenge_update_quiet {
    # OpenRA Yuri's Revenge latest commit available
    pushd -q /home/fusion809/GitHub/others/yr || return
    if ! command -v git > /dev/null 2>&1; then
        printf "git is not detected, either install it or if already installed at it to the system PATH.\n" && return
    fi
    git stash -q || return
    git fetch origin -q && git rebase origin -q || ( printf "ORAYRErr\n" && return )
    orlv=$(git rev-list --branches master --count)
    # latest packaged version
    orpv=$(grep "VERSION" < $HOME/.local/share/openra-yr | cut -d ' ' -f 2)

    if ! [[ $orpv == $orlv ]]; then
        yrup
    fi
    popd -q
}

alias yrupq=openra_yuris_revenge_update_quiet