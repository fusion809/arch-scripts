function cpman {
  sudo cp -a /usr/share/man/man$1/$2.$1 ~/Documents/Manpages
}

function cpmang {
  sudo cp -a /usr/share/man/man$1/$2.$1.gz ~/Documents/Manpages
}

function manconv {
  pushd $HOME/Documents/Manpages
  gzip -c $2.$1 > $2.$1.gz
  zcat $2.$1.gz | groff -mandoc -Thtml > $2.$1.html
  sudo chmod 777 -R *
  rm $2.$1.gz $2.$1
  popd
}

function manconvg {
  pushd $HOME/Documents/Manpages
  zcat $2.$1.gz | groff -mandoc -Thtml > $2.$1.html
  sudo chmod 777 -R *
  rm $2.$1.gz
  popd
}

function manhtml {
  cpman $1 $2 && manconv $1 $2 && cp -a $HOME/Documents/Manpages/* $HOME/GitHub/fusion809.github.io/man && cd $HOME/GitHub/fusion809.github.io/man
}

function manhtmlg {
  cpmang $1 $2 && manconvg $1 $2 && cp -a $HOME/Documents/Manpages/* $HOME/GitHub/fusion809.github.io/man && cd $HOME/GitHub/fusion809.github.io/man
}
