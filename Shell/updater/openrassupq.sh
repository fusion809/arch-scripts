function openra_sole_survivor_update_quiet {
    # OpenRA Sole Survivor mod latest commit available
    pushd -q /home/fusion809/GitHub/others/ss || return
    if ! command -v git > /dev/null 2>&1; then
        printf "%s\n" "git is not detected, please install it and if already installed add it to your system PATH!" && return
    fi
    git stash -q || return
    git pull origin master -q || ( printf "ORASSErr\n" && return )
    orlv=$(git rev-list --branches master --count)
    # Latest packaged version
    orpv=$(grep "VERSION" < $HOME/.local/share/openra-ss | cut -d ' ' -f 2)

    if ! [[ $orpv == $orlv ]]; then
        ssup
    fi
    popd -q
}

alias ssupq=openra_sole_survivor_update_quiet