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
