function openra_red_alert_unplugged_update_quiet {
    # OpenRA Red Alert Unplugged mod latest commit available
    pushd -q /home/fusion809/GitHub/others/uRA || return
    if ! command -v git > /dev/null 2>&1; then
        printf "git is not detected, please install it and if already installed add it to your system PATH!\n" && return
    fi
    git stash -q || return
    git pull origin master -q || ( printf "ORAuErr\n" && return )
    orlv=$(git rev-list --branches master --count)
    # latest packaged version
    orpv=$(grep "VERSION" < $HOME/.local/share/openra-ura | cut -d ' ' -f 2)

    if ! [[ $orpv == $orlv ]]; then
        uraup
    fi
    popd -q
}

alias uraupq=openra_red_alert_unplugged_update_quiet