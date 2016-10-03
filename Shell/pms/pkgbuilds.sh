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

#function vimup {
#  unset verc
#  unset verl
#  unset VIMDIR
#  ORPWD=$PWD
#  pushd $GHUBO/vim-src # change into my local Vim git repo copy
#  git checkout master
#  git fetch -p
#  git pull origin master # Update local repo
  # verc is the current patch version of Vim in vim.spec
  # verl is the latest patch version of Vim.

#  verc=$(sed -n 's/pkgver=7.4.//p' $PKG/../gvim/PKGBUILD)
#  verl=$(git describe --abbrev=0 --tags | sed 's/v7.4.//g')
#  popd
#  if [[ $verc == $verl ]]; then
#    echo "Vim is up-to-date"
#  else
#    printf "Removing pkgbuild-current database files.==>\n"
#    rm $PKG/pkgbuild-current/pkgbuild-current*

#    printf "Removing gvim binaries.==>\n"
#    rm $PKG/pkgbuild-current/gvim*.xz

#    pushd $PK/gvim
#
#      printf "Updating [gvim/gvim-gtk3] PKGBUILD.==>\n"
#      sed -i -e "s/pkgver=7.4.*/pkgver=7.4.$verl/g" PKGBUILD ../gvim-gtk3/PKGBUILD

#      printf "Removing old [gvim/gvim-gtk3] binaries and source archives.==>\n"
#      rm *.*z ../gvim-gtk3/*.*z

#      printf "Downloading new source archive and updating checksums for [gvim].==>\n"
#      updpkgsums

#      printf "Building binary package for [gvim].==>\n"
#      makepkg -s --noconfirm

#      printf "Uploading binary to GitHub.==>\n"
#      gothub upload -t current -n "gvim-7.4.$verl-1-x86_64.pkg.tar.xz" -f "gvim-7.4.$verl-1-x86_64.pkg.tar.xz"

#      printf "Copying [gvim] binary to [pkgbuild-current].==>\n"
#      cp *.pkg.tar.xz $PKG/pkgbuild-current

#      printf "Updating [gvim] GitHub repository.==>\n"
#      push "[gvim] Bumping to 7.4.$verl"

#    popd

#    pushd $PK/gvim-gtk3
#
#      printf "Generating new checksums for [gvim-gtk3].==>\n"
#      updpkgsums
#
#      printf "Building binary package for [gvim-gtk3].==>\n"
#      makepkg -si --noconfirm --needed
#
#      printf "Uploading binary to GitHub.==>\n"
#      gothub upload -t current -n "gvim-gtk3-7.4.$verl-1-x86_64.pkg.tar.xz" -f "gvim-gtk3-7.4.$verl-1-x86_64.pkg.tar.xz"
#
#      printf "Copying [gvim-gtk3] binary package to [pkgbuild-current].==>\n"
#      cp *.pkg.tar.xz $PKG/pkgbuild-current
#
#      printf "Updating [gvim-gtk3] GitHub repository.==>\n"
#      push "[gvim-gtk3] Bumping to 7.4.$verl"

#    popd

#    cd $PKG/pkgbuild-current
#    repo-add pkgbuild-current.db.tar.gz *.pkg.tar.xz
#    gruppc
#    cd -
#  fi
#}

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

  verc=$(sed -n 's/pkgver=8.0.//p' $PKG/../gvim/PKGBUILD)
  verl=$(git describe --abbrev=0 --tags | sed 's/v8.0.//g')
  popd
  if ! [[ $verc == $verl ]]; then
    cd $PK/gvim-gtk3
    sed -i -e "s/$verc/$verl/g" PKGBUILD
    push "Bumping to 8.0.$verl"
    cd ../gvim
    rm *.*z
    sed -i -e "s/$verc/$verl/g" PKGBUILD
    makepkg -sifC --noconfirm
    push "Bumping to 8.0.$verl"
    cdpk gvim-gtk3
    git pull origin master
    cdpk gvim
    git pull origin master
    cd ..
    push "Bumping gvim submodules to 8.0.$verl"
    cda gvim-gtk2
    rm *.*z
    sed -i -e "s/$verc/$verl/g" PKGBUILD
    updpkgsums
    push "Bumping pkgver to 8.0.$verl"
    cd ..
  fi
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

function pacv {
  _L=$(pacman -Slq pkgbuild-current)
  for i in "${_L[@]}"
  do
    pacas "$i" | grep aur
  done
}
