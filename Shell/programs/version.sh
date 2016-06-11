function npmver {
  if [[ -d $ATO/$1 ]]; then
    cat $ATO/$1/package.json | sed -n "s/  \"version\": \"//p" | sed 's/"//g' | sed 's/,//g'
  else
    cat $GHUBO/atom/$1/package.json | sed -n "s/  \"version\": \"//p" | sed 's/"//g' | sed 's/,//g'
  fi
}

function npmdeps {
  if [[ -d $ATO/$1 ]]; then
    cat $ATO/$1/package.json | sed -n "s/  \"dependencies\": {//p" | sed 's/"//g' | sed 's/,//g'
  else
    cat $GHUBO/atom/$1/package.json | sed -n "s/  \"dependencies\": {//p" | sed 's/"//g' | sed 's/,//g'
  fi
}

function npmddeps {
  if [[ -d $ATO/$1 ]]; then
    cat $ATO/$1/package.json | sed -n "s/  \"devDependencies\": //p" | sed 's/"//g' | sed 's/,//g'
  else
    cat $GHUBO/atom/$1/package.json | sed -n "s/  \"devDependencies\": //p" | sed 's/"//g' | sed 's/,//g'
  fi
}
