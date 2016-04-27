function atomup {
  unset OPWD
  unset verls
  unset verlb
  unset verc
  unset vercbb
  unset vercbd
  unset vercbr
  unset vercb
  unset vercd
  unset verl
  export OPWD=$PWD
  cd ~/Programs/atom
  git pull origin master
  git fetch -p
  git checkout master
  verls=$(git tag | tail -n "10" | grep -v beta | sed 's/v//g' | sort -nr | head -n1)
  verlb=$(git tag | tail -n "5" | grep beta | sed 's/v//g' | sort -nr | head -n1)
  cd -
  cd $GHUBM/PKGBUILDs/atom-editor
  vercs=$(sed -n 's/pkgver=//p' PKGBUILD)
  if [[ $vercs == $verls ]]; then
			echo "Atom is up-to-date"
  else
    sed -i -e "s/pkgver=$vercs/pkgver=$verls/g" PKGBUILD
    rm v$vercs.tar.gz
    updpkgsums
    push "[atom-editor] Bumping to $verls"
  fi
  cd -
  cd $GHUBM/PKGBUILDs/atom-editor-beta
  vercbb=$(sed -n 's/_pkgver=//p' PKGBUILD)
  vercbr=$(sed -n 's/_pkgrel=//p' PKGBUILD)
  vercb=$vercbb.$vercbr
  vercd=$vercbb-beta$vercbr
  if [[ $vercd == $verlb ]]; then
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
  cd -
  cd $OPWD
}

function vimupo {
  OPWD=$PWD
  cd $PKG/gvim-git
    makepkg -si --noconfirm --needed
  cd -
}

function mksrcinfo {
  makepkg --printsrcinfo > .SRCINFO
}

function blockup {
  unset verc
  unset verl
  unset OPWD
  export OPWD=$PWD
  cd $GHUBO/blockify
  git pull origin master
  verl=$(git describe --abbrev=0 --tags | sed 's/v//g')
  cd $PKG/blockify
  verc=$(sed -n 's/pkgver=//p' PKGBUILD)
  if ! [[ $verl == $verc ]]; then
    sed -i -e "s/pkgver=$verc/pkgver=$verl/g" PKGBUILD
    upmak
    push "Updating"
  fi
  cd $OPWD
}
