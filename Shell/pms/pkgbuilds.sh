function atomup {
  unset TAG
  unset verc
  unset verl
  pushd ~/Programs/atom
  git pull origin master
  git fetch -p
  git checkout master
  verls=$(git tag | tail -n "10" | grep -v beta | sed 's/v//g' | sort -nr | head -n1)
  verlb=$(git tag | tail -n "5" | grep beta | sed 's/v//g' | sort -nr | head -n1)
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
  popd
}
