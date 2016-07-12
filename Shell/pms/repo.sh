function repup {
  if ! [[ $PWD == "$PKG/pkgbuild-current" ]]; then
    cdpc
  fi
  if [[ -n "$1" ]]; then
    if [[ -f "$1".db ]]; then
      rm "$1"*
    fi
    repo-add "$1".db.tar.gz *.pkg.tar.xz
  else
    if [[ -f "pkgbuild-current.db" ]]; then
      rm pkgbuild-current*
    fi
    repo-add pkgbuild-current.db.tar.gz *.pkg.tar.xz
  fi
}

function grup {
  if [[ -n "$1" ]]; then
    gothub upload -t current -n "$@" -f "$@"
  else
    printf "You must provide an input!\n If you would like to upload all .pkg.tar.xz files in $PWD, run:\n grup *.pkg.tar.xz.\n"
  fi
}

function gruppc {
  if ! [[ $PWD == "$PKG/pkgbuild-current" ]]; then
    cd $PKG/pkgbuild-current
  fi
  gothub upload -t current -n "pkgbuild-current.db.tar.gz" -f "pkgbuild-current.db.tar.gz" -R
  gothub upload -t current -n "pkgbuild-current.db" -f "pkgbuild-current.db" -R
  gothub upload -t current -n "pkgbuild-current.files.tar.gz" -f "pkgbuild-current.files.tar.gz" -R
  gothub upload -t current -n "pkgbuild-current.files" -f "pkgbuild-current.files" -R
}
