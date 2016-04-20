function gitc {
	for i in "$@"
	do
		git clone https://github.com/fusion809/$i.git $GHUBM/$i
		pushd $GHUBM/$i
		gitsw
		popd
	done
}

function ginit {
	git init && git add --all && gitsw
}
