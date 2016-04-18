function hexgd {
  if [[ $PWD == "/home/fusion809/GitHub/hexo-site" ]]; then
    hexo generate --deploy
  else
    pushd /home/fusion809/GitHub/hexo-site
    hexo generate --deploy
    popd
  fi
}
