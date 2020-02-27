function openra_shattered_paradise_update_quiet {
    # OpenRA Shattered Paradise latest commit on the master branch
    # available
    pushd -q /home/fusion809/GitHub/others/SP-OpenRAModSDK || return
    # update repository
    if command -v git > /dev/null 2>&1; then
        git stash -q || return
        git pull origin Shattered-Paradise-Master -q || ( printf "ORASPrr\n" && return )
    else
        printf "git isn't found. Please install it, or if it is installed edit your system PATH." && return
    fi

    sdklv=$(git rev-list --branches Shattered-Paradise-Master --count)
    # OpenRA Shattered Paradise latest packaged version
    sdkpv=$(grep "VERSION" < $HOME/.local/share/openra-sp | cut -d ' ' -f 2)

    if ! [[ $sdkpv == $sdklv ]]; then
        spup
    fi
    popd -q
}

alias spupq=openra_shattered_paradise_update_quiet