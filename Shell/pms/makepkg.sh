# Search PKGBUILDs for keywords
function greppk {
  if [[ $1 == "--help" ]]; then
    echo "This function will search for PKGBUILDs in /var/abs with the keyword inputted"
    grep --include="PKGBUILD" -R "$1" /var/abs/
  else
    grep --include="PKGBUILD" -R "$1" /var/abs/
  fi
}

# Makepkgs
function makin {
  makepkg -sif --noconfirm
}

alias mkpkg=makin
alias pkg=makin

# Make the latest gvim-git package
function mkgv {
  cdgv && makepkg -si --noconfirm
}

# Make the latest stable Atom package
function mkat {
  xdg-open https://github.com/atom/atom/releases
  cdatp
  vim PKGBUILD
  makepkg -si --noconfirm
}

# Make the latest stable Atom package
function mkatb {
  xdg-open https://github.com/atom/atom/releases
  cdatpb
  vim PKGBUILD
  makepkg -si --noconfirm
}
