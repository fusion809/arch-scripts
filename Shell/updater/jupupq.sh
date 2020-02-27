function jupyterlab_update_quiet {
    pushd -q /home/fusion809/GitHub/others/jupyterlab || return

    # update repository
    if command -v git > /dev/null 2>&1; then
        git stash -q || return
        git pull origin master -q || ( printf "JLabErr\n" && return )
    else
        printf "%s\n" "git isn't found. Please install it, or if it is installed edit your system PATH." && return
    fi

    # Determine latest commit's number
    orlv=$(git rev-list --branches master --count)
    # jupyterlab latest packaged version
    orpv=$(cat /data/GitHub/mine/packaging/jupyterlab-archpkg/PKGBUILD | grep "^pkgver" | cut -d '=' -f 2)

    if ! [[ "$orpv" == "$orlv" ]]; then
        jupup
    fi
    popd -q
}

alias jupupq=jupyterlab_update_quiet