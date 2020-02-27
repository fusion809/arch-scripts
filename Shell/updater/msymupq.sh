function libmsym_update_quiet {
    pushd -q /home/fusion809/GitHub/others/libmsym || return

    if command -v git > /dev/null 2>&1; then
        git stash -q || return
        git pull origin master -q || ( printf "LSYSErr\n" && return )
        orlv=$(git rev-list --branches master --count)
    else
        printf "git has not been detected in the system PATH. Please either install it, if it is not already installed, or add it to the system PATH if it already is.\n"
    fi

    # libmsym latest packaged version
    orpv=$(cat /home/fusion809/OBS/home:fusion809/libmsym/libmsym0_2.spec | grep "Version:" | sed 's/Version:\s*//g')

    if ! [[ $orpv == $orlv ]]; then
        libmsymup
    fi
    popd -q
}

alias msymupq=libmsym_update_quiet