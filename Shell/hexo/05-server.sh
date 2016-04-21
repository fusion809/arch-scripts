function hss {
  if ! [[ $PWD == $HS ]]; then
    cd $HS
  fi
  hexo server -p 5000
}

alias hexs=hss
