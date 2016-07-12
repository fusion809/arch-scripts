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
