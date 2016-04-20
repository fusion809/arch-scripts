function gitc {
	for i in "$@"
	do
		git clone https://github.com/fusion809/$i.git $GHUBM/$i
		pushd $GHUBM/$i
		gitsw
		popd
	done
}

function gitco {
	git clone https://github.com/$1/$2 $GHUBO/$2
}


function ginit {
	git init && git add --all && gitsw
}
