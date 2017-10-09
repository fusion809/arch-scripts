function vd {
    pushd $1
    vim
    popd
}

function sv {
    sudo vim "$@"
}

for i in $HOME/Shell/edit/vim/*.sh
do
    . "$i"
done
