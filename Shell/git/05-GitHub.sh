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

function gitsub {
	git submodule add https://github.com/fusion809/$1
}

function gitmv {
	pushd $GHUBM/packaging
	mv PKGBUILDs/$1 .
	cd $1 && git init && gitsw && hub create
	push "Initial commit"
	cd PKGBUILDs && push "Moving $1 to own repo" && gitsub $1 && push "Adding $1 as submodule" && cd -
	popd
}

function gitco {
	git clone https://github.com/$1/$2 $GHUBO/$2
}


function ginit {
	git init && git add --all && gitsw
}
