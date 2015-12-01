function cpman {
  mkdir $HOME/Documents/Manpages
  sudo cp -a /usr/share/man/man$1/$2.$1.bz2 ~/Documents/Manpages
}

function manconv {
  pushd $HOME/Documents/Manpages
  gzip -c $2.$1 > $2.$1.gz
  zcat $2.$1.gz | groff -mandoc -Thtml > $2.$1.html
  sudo chmod 777 -R *
  rm $2.$1.gz $2.$1
  popd
}

function manhtml {
  cpman $1 $2 && manconv $1 $2 && cp -a * 
$HOME/GitHub/fusion809.github.io/man && cd 
$HOME/GitHub/fusion809.github.io/man
}
