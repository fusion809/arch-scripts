function makin {
  makepkg -sif --noconfirm
}

function greppk {
  if [[ $1 == "--help" ]]; then
    echo "This function will search for PKGBUILDs in /var/abs with the keyword inputted"
    grep --include="PKGBUILD" -R "$1" /var/abs/
  else
    grep --include="PKGBUILD" -R "$1" /var/abs/
  fi
}
