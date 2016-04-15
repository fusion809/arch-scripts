function gitc {
	for i in "$@"
	do
		git clone https://github.com/fusion809/$i.git $GHUB/$i
		pushd $GHUB/$i
		gitsw
		popd
	done
}

function ginit {
	git init && git add --all && gitsw
}
