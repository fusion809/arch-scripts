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
  gitc arch-setup archiso \
    atom atom-installer \
    arch-scripts centos-scripts debian-scripts fedora-scripts freebsd-scripts gentoo-scripts Linux-scripts mageia-scripts opensuse-scripts sabayon-scripts \
    arch-builder gentoo-packer sabayon-packer \
    fusion809.github.io hexo-site hexo-tag-markdown hubpress.io pelican-site \
    bin JScripts npm2archOBS python-scripts \
    DiscoveryStudio GNU_Octave \
    spacemacs xdg-menus vim
}
