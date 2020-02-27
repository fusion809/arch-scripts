function spglib_update_quiet {
    # spglib latest version available
    pushd -q /home/fusion809/GitHub/others/spglib || return
    if command -v git > /dev/null 2>&1; then
        git stash -q || return
        git pull origin master -q || ( printf "spglibErr\n" && return )
        orlv=$(git rev-list --branches master --count)
    else
        printf "git has not been detected in the system PATH. Please either install it, if it is not already installed, or add it to the system PATH if it already is.\n"
    fi

    # latest packaged version
    orpv=$(cat /home/fusion809/OBS/home:fusion809/spglib/spglib.spec | grep "Version:" | sed 's/Version:\s*//g')

    if ! [[ $orpv == $orlv ]]; then
        spglibup
    fi
    popd -q
}

alias spglibupq=spglib_update_quiet