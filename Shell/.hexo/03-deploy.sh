function hexgd {
  if [[ $PWD == "$GHUBM/hexo-site" ]]; then
    hexo generate --deploy
  else
    cd $GHUBM/hexo-site
    hexo generate --deploy
  fi
}

function hexup {
  hexgd && push "Updating"
}
