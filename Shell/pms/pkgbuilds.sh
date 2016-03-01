function atomup {
  unset verc
  unset verl
  pushd ~/Programs/atom
  git checkout stable
	git pull origin stable
	verls=$(git describe --tags | sed 's/^v//;s/-/./g')
  git checkout beta
  git pull origin beta
  verlb=$(git describe --tags | sed 's/^v//;s/-/./g')
  popd
  pushd ~/GitHub/PKGBUILDs/atom-editor
  vercs=$(sed -n 's/pkgver=//p' PKGBUILD)
  if [[ $vercs == $verls ]]; then
			echo "Atom is up-to-date"
  else
    sed -i -e "s/pkgver=$vercs/pkgver=$verls/g" PKGBUILD
    rm v$vercs.tar.gz
    updpkgsums
    push "[atom-editor] Bumping to $verls"
  fi
  popd
  pushd ~/GitHub/PKGBUILDs/atom-editor-beta
  vercbb=$(sed -n 's/_pkgver=//p' PKGBUILD)
  vercbr=$(sed -n 's/_pkgrel=//p' PKGBUILD)
  vercb=$vercbb.$vercbr
  vercd=$vercbb-$vercbr
  if [[ $vercb == $verlb ]]; then
      echo "Atom Beta is up-to-date"
  else
    verlbb=${verlb%.*}
    verlbr=${verlb##*beta}
    verlbd=$verlbb-beta$verlbr
    sed -i -e "s/_pkgver=$vercbb/_pkgver=$verlbb/g" \
           -e "s/_pkgrel=$vercbr/_pkgrel=$verlbr/g" PKGBUILD
    rm v$vercd.tar.gz
    updpkgsums
    push "[atom-editor-beta] Bumping to $verlbd"
  fi
  popd
}

function vimup {
	unset verc
	unset verl
	unset VIMDIR
	ORPWD=$PWD
	pushd /home/fusion809/GitHub/vim-src
	git checkout master
	git fetch -p
	git pull origin master # Update local repo
	# verc is the current patch version of Vim in vim.spec
	# verl is the latest patch version of Vim.
	VIMDIR=$HOME/GitHub/PKGBUILDs/gvim-git
	verc=$(sed -n 's/pkgver=7.4.//p' $VIMDIR/PKGBUILD)
	verl=$(git describe --abbrev=0 --tags | sed 's/v7.4.//g')
	popd
	if [[ $verc == $verl ]]; then
		echo "Vim is up-to-date"
	else
		pushd $VIMDIR
		makepkg -si --noconfirm
		push "[gvim-git] Updating to 7.4.$verl"
		popd
	fi
  cd $ORPWD
}
