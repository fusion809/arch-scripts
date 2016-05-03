## Update local arch-scripts repo
function cps {
  sudo chmod +x -R {$HOME,/root}/Shell/
  rm -rf $ARS/Shell && mkdir $ARS/Shell
  sudo rm -rf $ARS/root/Shell
  cp -a ~/Shell/* $ARS/Shell
  cp -a ~/{.bashrc,.zshrc} $ARS/
  sudo cp -a /root/{Shell,.bashrc,.zshrc} $ARS/root/
}

function cdas {
  cd $ARS
}

## Update sabayon-scripts GitHub repo
function shup {
  cps && cdas && push "$1" && cd - && szsh
}

function sudoers {
	sudo cp -a $GHUBM/arch-scripts/etc/sudoers /etc/sudoers
}

## Update bin repo
function bup {
  cd $HOME/bin
  if [[ -n "$1" ]]; then
    push "$1"
  else
    push "Updating"
  fi
  cd -
}

function shupat {
  cd ~/.atom
  pushat "Updating"
  cd -
}

function aset {
  printf "Do you want to clone all my GitHub repos? [y/n] "
  read yn
  if [[ $yn == 'y' ]]; then
    gitc archiso fedora-ISO \
      arch-scripts centos-scripts debian-scripts fedora-scripts freebsd-scripts gentoo-scripts Linux-scripts mageia-scripts opensuse-scripts sabayon-scripts \
      atom atom-installer \
      arch-builder arch-setup gentoo-packer sabayon-packer \
      fusion809.github.io hexo-site hexo-tag-markdown hubpress.io pelican-site \
      bin JScripts npm2archOBS python-scripts \
      DiscoveryStudio GNU_Octave \
      spacemacs xdg-menus vim zsh-theme \
      PKGBUILDs rpmbuild sabayon-tools
  else
    # Clone ISO repos
    printf "Do you want to clone both ISO repos? [y/n] "
    read yn1
    if [[ $yn1 == 'y' ]]; then
      gitc archiso fedora-ISO
    else
      printf "Do you want to clone the archiso repo? [y/n] "
      read yn2
      if [[ $yn2 == 'y' ]]; then
        gitc archiso
      fi
    fi

    # Clone all OS shell script repos
    printf "Do you want to clone all the OS shell script repos? [y/n] "
    read yn3
    if [[ $yn3 == 'y' ]]; then
      gitc {arch,centos,debian,fedora,freebsd,gentoo,Linux,mageia,opensuse,sabayon}-scripts
    fi

    # Clone all config repos
    printf "Do you want to clone all configuration (e.g., for the Atom text editor) repos? [y/n] "
    read yn4
    if [[ $yn4 == 'y' ]]; then
      gitc atom spacemacs vim xdg-menus
    fi

    # Clone all installer repos
    printf "Do you want to clone all installer repos? [y/n] "
    read yn5
    if [[ $yn5 == 'y' ]]; then
      gitc arch-builder atom-installer arch-setup gentoo-packer sabayon-packer
    fi

    # Clone all theme repos
    printf "Do you want to clone all theme repos? [y/n] "
    read yn6
    if [[ $yn6 == 'y' ]]; then
      gitc sabayon-gitsta zsh-theme
    fi

    # Clone all repos feeding The Hornery
    printf "Do you want to clone all repos that feed The Hornery (A) or would you rather just clone fusion809.github.io (B)? "
    read TH
    if [[ $TH == 'A' ]]; then
      gitc fusion809.github.io hexo-site hubpress.io pelican-site
    else
      gitc fusion809.github.io
    fi

    # Clone all programming repos
    printf "Do you want to clone all my programming GitHub repos? [y/n] "
    read yn7
    if [[ $yn7 == 'y' ]]; then
      gitc bin JScripts npm2archOBS python-scripts
    fi

    # Clone all science program repos
    printf "Do you want to clone all my science program repos? [y/n] "
    read yn8
    if [[ $yn8 == 'y' ]]; then
      gitc DiscoveryStudio GNU_Octave
    fi

    # Clone packaging repos
    printf "Do you want to clone my packaging GitHub repos (A) or would you rather just clone the PKGBUILDs repo (B)? "
    read PKR
    if [[ $PKR == 'A' ]]; then
      gitc PKGBUILDs rpmbuild sabayon-tools
    elif [[ $PKR == 'B' ]]; then
      gitc PKGBUILDs
    fi

    # Clone hexo-tag-markdown repo
    printf "Do you want to clone the hexo-tag-markdown repo? [y/n] "
    read yn9
    if [[ $yn9 == 'y' ]]; then
      gitc hexo-tag-markdown
    fi
  fi
}
