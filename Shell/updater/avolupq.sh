function avogadrolibs_update_quiet {
    # Avogadro2 libs
    pushd -q /home/fusion809/GitHub/others/avogadrolibs
    # Check for git command
    if command -v git > /dev/null 2>&1; then
        git stash -q || return
        git pull origin master -q || ( printf "AvoLErr\n" && return )
        orlv=$(git rev-list --branches master --count)
    else
        printf "git has not been detected in the system PATH. Please either install it, if it is not already installed, or add it to the system PATH if it already is.\n"
    fi

    # Avogadro 2 libs latest packaged version
    orpv=$(grep "Version:" < /home/fusion809/OBS/home:fusion809/avogadro2-libs/avogadro2-libs.spec | sed 's/Version:\s*//g')
    if ! [[ $orlv == $orpv ]]; then
        avolup
    fi
    popd -q
}

alias avolupq=avogadrolibs_update_quiet