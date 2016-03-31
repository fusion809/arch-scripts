## Update local arch-scripts repo
function cps {
  rm -rf $ARS/Shell/*
  sudo rm -rf $ARS/root/Shell/*
  sudo chmod +x {$HOME,/root}/Shell/{*,*/*.sh}
  cp -a ~/Shell/* $ARS/Shell
  cp -a ~/{.bashrc,.zshrc} $ARS/
  sudo cp -a /root/{Shell,.bashrc,.zshrc} $ARS/root/
}

function cdas {
  cd $ARS
}

## Update sabayon-scripts GitHub repo
function shup {
  cps && cdas && push "$1" && cd -
}

function sudoers {
	sudo cp -a /home/fusion809/GitHub/arch-scripts/etc/sudoers /etc/sudoers
}
