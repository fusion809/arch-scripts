function jekex {
  cdfgi
  bundle update && bundle install && bundle exec jekyll serve -ID --future $@
}

function jekexc {
  cdfgi
  bundle update && bundle install && bundle exec jekyll serve --future -D
}

function jekset {
  if ! [[ -d $FGI ]]; then
    git clone fusion809.github.io $FGI
  fi
  cd $FGI
  pacin rubygems
  gem install bundler
  bundle install
}
