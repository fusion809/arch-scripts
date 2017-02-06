function vfgi {
	pushd $FGI
	vim
	popd
}

for i in $HOME/Shell/edit/vim/*.sh
do
	. "$i"
done
