function jekex {
  cd $FGI
	jekyll serve -I --future $@
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
