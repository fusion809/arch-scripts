function atomup {
  unset TAG
  unset verc
  unset verl
  pushd ~/Programs/atom
  git pull origin master
  TAG=$(git describe --tags $(git rev-list --tags --max-count=2) | sed 's/v//g')
  verls=$(echo $TAG | sed -n 2p)
  verlb=$(echo $TAG | sed -n 1p)
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
