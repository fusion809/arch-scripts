function cdfgi {
	cd $FGI
}

function jekex {
  cd $FGI
  jekyll serve -IDo --future --unpublished
}

function jekset {
  if ! [[ -d $FGI ]]; then
    gitc fusion809.github.io
  fi
  cd $FGI
  pacin rubygems
  gem install bundler
  bundle install
}

function wgetg {
	wget -c https://gist.github.com/$1
}

function wgetjs {
  cd $FGI/js/gist
	for i in "$@"
	do
		wget -c https://gist.github.com/$i.js
	done
}

function wgetcss {
	cd $FGI/css/gist
	for i in "$@"
	do
		wget -c https://assets-cdn.github.com/assets/gist/embed-$i.css
	done
}
