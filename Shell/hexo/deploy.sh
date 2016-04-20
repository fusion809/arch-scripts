function hexgd {
  if [[ $PWD == "$GHUBM/hexo-site" ]]; then
    hexo generate --deploy
  else
    pushd $GHUBM/hexo-site
    hexo generate --deploy
    popd
  fi
}
