function wgetg {
	wget -c https://gist.github.com/$1
}

function wgetjs {
  cd $FGI/js/gist
	for i in "$@"
	do
		wget -c https://gist.github.com/$i.js

    # Replace GIST CSS link with local equiv
		GIST=https://assets-cdn.github.com/assets/
		CSS=/css/
		sed -i 's%$GIST%$CSS%g' $i.js
	done
}

function wgetcss {
	cd $FGI/css/gist
	for i in "$@"
	do
		wget -c https://assets-cdn.github.com/assets/gist/embed-$i.css
	done
}
