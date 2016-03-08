function vimup {
  unset verc
  unset verl
  unset VIMDIR
  ORPWD=$PWD
  pushd ~/GitHub/vim-src # change into my local Vim git repo copy
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
    sed -i -e "s/pkgver=7.4.$verc/pkgver=7.4.$verl/g" PKGBUILD
    osc ci -m --noservice "Updating to version 7.4.$verl"
    popd
  fi
}
