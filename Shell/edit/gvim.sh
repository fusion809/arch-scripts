function gvd {
    pushd $1
    gvim
    popd
}

for i in $HOME/Shell/edit/gvim/*.sh
do
	. "$i"
done
