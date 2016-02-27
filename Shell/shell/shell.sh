function cpsh {
  if [[ -d $ARS ]]; then
    cd $ARS
    git pull origin master
    cd -
  else
    mkdir -p $ARS
    git clone https://github.com/fusion809/arch-scripts $ARS
  fi

  cp -a $ARS/{.bashrc,.zshrc} ~/
  cp -a $ARS/Shell ~/
  sudo cp -a $ARS/root/Shell /root/Shell
  sudo cp -a $ARS/root/{.bashrc,.zshrc} /root
}
