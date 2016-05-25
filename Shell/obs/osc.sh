function vimups {
  unset verc
  unset verl
  unset VIMDIR
  ORPWD=$PWD
  pushd $GHUBO/vim-src # change into my local Vim git repo copy
  git checkout master
  git fetch -p
  git pull origin master # Update local repo
  # verc is the current patch version of Vim in vim.spec
  # verl is the latest patch version of Vim.
  VIMDIR=/home/fusion809/OBS/home:fusion809/vim
  verc=$(sed -n 's/%define patchlevel\s\s*//p' $VIMDIR/vim.spec)
  verl=$(git describe --abbrev=0 --tags | sed 's/v7.4.//g')
  popd
  if [[ $verc == $verl ]]; then
    echo "Vim is up-to-date"
  else
    pushd $VIMDIR
      sed -i -e "s/%define patchlevel  $verc/%define patchlevel  $verl/g" vim.spec
      osc ci -m "Updating to version 7.4.$verl"
    popd
    pushd $PKG/gvim
      sed -i -e "s/pkgver=7.4.*/pkgver=7.4.$verl/g" PKGBUILD
      rm *.*z
      updpkgsums
    popd
    pushd $PKG/gvim-gtk3
      sed -i -e "s/pkgver=7.4.*/pkgver=7.4.$verl/g" PKGBUILD
      rm *.*z
      updpkgsums
      makepkg -si --noconfirm --needed
      push "[gvim/gvim-gtk3] Bumping to 7.4.$verl"
    pushd $OBSE/gvim
      sed -i -e "s/pkgver=7.4.*/pkgver=7.4.$verl/g" PKGBUILD
      rm *.*z
      updpkgsums
      osc ci -m "Bumping to 7.4.$verl"
    popd
    pushd $OBSE/gvim-gtk3
      sed -i -e "s/pkgver=7.4.*/pkgver=7.4.$verl/g" PKGBUILD
      rm *.*z
      updpkgsums
      osc ci -m "Bumping to 7.4.$verl"
    popd
  fi
}

function vimup {
  unset verc
  unset verl
  unset VIMDIR
  ORPWD=$PWD
  pushd $GHUBO/vim-src # change into my local Vim git repo copy
  git checkout master
  git fetch -p
  git pull origin master # Update local repo
  # verc is the current patch version of Vim in vim.spec
  # verl is the latest patch version of Vim.

  verc=$(sed -n 's/pkgver=7.4.//p' $PKG/gvim/PKGBUILD)
  verl=$(git describe --abbrev=0 --tags | sed 's/v7.4.//g')
  popd
  if [[ $verc == $verl ]]; then
    echo "Vim is up-to-date"
  else
    pushd $PKG/gvim
      sed -i -e "s/pkgver=7.4.*/pkgver=7.4.$verl/g" PKGBUILD
      rm *.*z
      updpkgsums
    popd
    pushd $PKG/gvim-gtk3
      sed -i -e "s/pkgver=7.4.*/pkgver=7.4.$verl/g" PKGBUILD
      rm *.*z
      updpkgsums
      makepkg -si --noconfirm --needed
      push "[gvim/gvim-gtk3] Bumping to 7.4.$verl"
    popd
  fi
}

function cpc {
	for i in "$@"
	do
		osc copypac home:fusion809 $i home:fusion809:arch_extra $i
	done
}
