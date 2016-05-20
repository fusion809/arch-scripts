function gitc {
	for i in "$@"
	do
		if ! [[ -d $GHUBM ]]; then
			mkdir -p $GHUBM
		fi
		if [[ $i == 'atom' ]]; then
			if ! [[ -d $HOME/.atom ]]; then
				mkdir $HOME/.atom
			fi
			cd $HOME/.atom
			gitsw
			git pull origin master
			cd -
		elif ! [[ -d $GHUBM/$i ]]; then
			git clone https://github.com/fusion809/$i.git $GHUBM/$i
		fi
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
