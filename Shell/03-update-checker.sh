function updater {
    # Avogadro2
    pushd /home/fusion809/GitHub/others/avogadroapp
    # Check for git command
    if command -v git > /dev/null 2>&1; then
        git stash -q || return
        git pull origin master -q || ( printf "AvoAErr\n" && return )
        orlv=$(git rev-list --branches master --count)
    else
        printf "git has not been detected in the system PATH. Please either install it, if it is not already installed, or add it to the system PATH if it already is.\n"
    fi

    # Avogadro 2 latest packaged version
    orpv=$(grep "Version:" < /home/fusion809/OBS/home:fusion809/avogadro2/avogadro2.spec | sed 's/Version:\s*//g')
    if ! [[ $orlv == $orpv ]]; then
        avoup
    fi

    # Avogadro libs
}