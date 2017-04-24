function vfgi {
	pushd $FGI
	vim
	popd
}

alias vblog=vfgi

function gvfgi {
	gvim $FGI
}

gvblog=gvfgi
