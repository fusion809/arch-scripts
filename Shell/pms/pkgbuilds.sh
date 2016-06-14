function atomup {
  # Unset variables
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

  # Set old PWD
  export OPWD=$PWD

  # Get Atom GitHub repo, if not already present at $HOME/Programs/atom
  if ! [[ -d $HOME/Programs/atom ]]; then
    git clone https://github.com/atom/atom $HOME/Programs/atom
  fi

  # Change into repo
  pushd $HOME/Programs/atom

    # Update repo
    git pull origin master
    git fetch -p
    git checkout master

    # Determine the latest stable ($verls) and latest beta ($verlb) release from this repo
    verls=$(git tag | tail -n "10" | grep -v beta | sed 's/v//g' | sort -nr | head -n1)
    verlb=$(git tag | tail -n "5" | grep beta | sed 's/v//g' | sort -nr | head -n1)

  popd # change back out

  # Change into the atom-editor PKGBUILD folder
  pushd $PKG/../atom-editor

    # Determine the stable version of Atom mentioned in this PKGBUILD
    vercs=$(sed -n 's/pkgver=//p' PKGBUILD)

    # Compare the latest stable version with the stable version listed in the atom-editor PKGBUILD
    if [[ $vercs == $verls ]]; then
        echo "Atom is up-to-date"
    else
      # Update the atom-editor PKGBUILD
      sed -i -e "s/pkgver=$vercs/pkgver=$verls/g" PKGBUILD

      # Also update the atom-editor-sync PKGBUILD
      sed -i -e "s/pkgver=$vercs/pkgver=$verls/g" ../atom-editor-sync/PKGBUILD

      # rm the source code tarball of Atom $vercs in the atom-editor PKGBUILD folder
      if [[ -f v$vercs.tar.gz ]]; then
        rm v$vercs.tar.gz
      fi

      # rm the source code tarball of Atom $vercs in the atom-editor-sync PKGBUILD folder
      if [[ -f ../atom-editor-sync/v$vercs.tar.gz ]]; then
        rm ../atom-editor-sync/v$vercs.tar.gz
      fi

      # Update PKGBUILD checksums for atom-editor
      updpkgsums

      # Update PKGBUILD checksums for atom-editor-sync too
      pushd ../atom-editor-sync
        updpkgsums
      popd

      # Commit the changes to the fusion809/PKGBUILDs GitHub repo
      push "[atom-editor] Bumping to $verls"
    fi
  popd

  # Change into the atom-editor-beta PKGBUILD folder
  pushd $PKG/../atom-editor-beta

    # atom-editor-beta base version (e.g., 1.8.0)
    vercbb=$(sed -n 's/_pkgver=//p' PKGBUILD)

    # atom-editor-beta revision (e.g., 4 for 1.8.0-beta4)
    vercbr=$(sed -n 's/_pkgrel=//p' PKGBUILD)

    # atom-editor-beta combined versioning for PKGBUILDs (e.g., 1.8.0.4)
    vercb=$vercbb.$vercbr

    # atom-editor-beta combined versioning (standard format) (e.g., 1.8.0-beta4)
    vercd=$vercbb-beta$vercbr

    if [[ $vercd == $verlb ]]; then
        echo "Atom Beta is up-to-date"
    else

      # base beta version from GitHub repo (latest)
      verlbb=${verlb%.*}

      # revision number from GitHub repo
      verlbr=${verlb##*beta}

      # combined version (standard format, e.g., 1.8.0-beta4) from GitHub repo
      verlbd=$verlbb-beta$verlbr

      # Update PKGBUILD version
      sed -i -e "s/_pkgver=$vercbb/_pkgver=$verlbb/g" \
            -e "s/_pkgrel=$vercbr/_pkgrel=$verlbr/g" PKGBUILD

      # Remove existing source code tarball for version of atom-editor-beta previously in the PKGBUILD
      if [[ -f v$vercd.tar.gz ]]; then
        rm v$vercd.tar.gz
      fi

      # Update checksums
      updpkgsums

      # Commit the changes
      push "[atom-editor-beta] Bumping to $verlbd"
    fi
  popd

  cd $OPWD
}

function vimupo {
  # Make the latest version of Vim using the gvim-git package
  cd $PKG/../gvim-git
    makepkg -si --noconfirm --needed
  cd -
}

if ! `comc mksrcinfo`; then
  echo "mksrcinfo unset; defining"

  # Set mksrcinfo
  function mksrcinfo {
    makepkg --printsrcinfo > .SRCINFO
  }
fi

function linup {
  unset verc
  unset verl
  unset OPWD
  export OPWD=$PWD
  cd $HOME/AUR/linux-ck
  git pull origin master
  verl=$(sed -n 's/pkgver=//p' PKGBUILD)
  cd $PK/linux-ck
  verc=$(sed -n 's/pkgver=//p' PKGBUILD)
  if ! [[ $verc == $verl ]]; then
    sed -i -e "s/pkgver=$verc/pkgver=$verl/g" PKGBUILD
    upmakin
    push "Updating"
  fi
  cd $OPWD
}

function blockup {
  unset verc
  unset verl
  unset OPWD
  export OPWD=$PWD
  cd $GHUBO/blockify
  git pull origin master
  git fetch -p
  verl=$(git describe --abbrev=0 --tags | sed 's/v//g')
  cd $PKG/../blockify
  verc=$(sed -n 's/pkgver=//p' PKGBUILD)
  if ! [[ $verl == $verc ]]; then
    sed -i -e "s/pkgver=$verc/pkgver=$verl/g" PKGBUILD
    upmakin
    push "Updating"
  fi
  cd $OPWD
}
