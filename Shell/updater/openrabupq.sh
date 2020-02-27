function openra_bleed_update_quiet {
    # OpenRA latest commit on the bleed branch available
    pushd -q /home/fusion809/GitHub/others/OpenRA || return
    # update repository
    if command -v git > /dev/null 2>&1; then
        git stash -q || return
        git pull origin bleed -q || ( printf "ORABErr\n" && return )
    else
        printf "git isn't found. Please install it, or if it is installed edit your system PATH." && return
    fi

    orlv=$(git rev-list --branches bleed --count)
    # OpenRA latest packaged version
    orpv=$(grep "Version:" < /home/fusion809/OBS/home:fusion809/openra-bleed/openra-bleed.spec | sed 's/Version:\s*//g')

    if ! [[ "$orpv" == "$orlv" ]]; then
        openrabup
    fi
    popd -q
}

alias openrabupq=openra_bleed_update_quiet