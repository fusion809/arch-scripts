function cpsh {
  export ARS=$HOME/GitHub/arch-scripts
  if ! [[ -d $ARS ]]; then
    mkdir -p $ARS
    git clone https://github.com/fusion809/arch-scripts $ARS
  fi

  cp -a $ARS/{.bashrc,.zshrc} ~/
  cp -a $ARS/Shell ~/
  sudo cp -a $ARS/root/Shell /root/Shell
  sudo cp -a $ARS/root/{.bashrc,.zshrc} /root
}
