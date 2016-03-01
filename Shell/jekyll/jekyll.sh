function jekex {
  cd $FGI
	bundle exec jekyll serve -I --future $@
}

function jekexc {
  cd $FGI
  bundle exec jekyll serve --future
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
