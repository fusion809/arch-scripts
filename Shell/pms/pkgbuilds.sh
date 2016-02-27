function atomup {
  unset verc
  unset verl
  pushd ~/Programs/atom
  git checkout stable
	git pull origin stable
	verl=$(git describe --tags | sed 's/^v//;s/-/./g')
  popd
  pushd ~/GitHub/PKGBUILDs/atom-editor
  verc=$(sed -n 's/pkgver=//p' PKGBUILD)
  if [[ $verc == $verl ]]; then
			echo "Atom is up-to-date"
  else
    sed -i -e "s/pkgver=$verc/pkgver=$verl/g" PKGBUILD
    rm v$verc.tar.gz
    updpkgsums
    push "Bumping to $verl"
  fi
  popd
}

function vimup {
	unset verc
	unset verl
	unset VIMDIR
	ORPWD=$PWD
	pushd /home/fusion809/GitHub/vim
	git checkout master
	git fetch -p
	git pull origin master # Update local repo
	# verc is the current patch version of Vim in vim.spec
	# verl is the latest patch version of Vim.
	VIMDIR=/home/fusion809/GitHub/PKGBUILDs/gvim-git
	verc=$(sed -n 's/pkgver=7.4.//p' $VIMDIR/PKGBUILD)
	verl=$(git describe --abbrev=0 --tags | sed 's/v7.4.//g')
	popd
	if [[ $verc == $verl ]]; then
		echo "Vim is up-to-date"
	else
		pushd $VIMDIR
		sed -i -e "s/pkgver=7.4.$verc/pkgver=7.4.$verl/g" PKGBUILD
		push "[gvim-git] Updating to 7.4.$verl"
		popd
	fi
}
