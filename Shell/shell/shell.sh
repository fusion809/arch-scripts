function cpsh {
  if [[ -d $ARS ]]; then
    cd $ARS
    git pull origin master
    cd -
  else
    mkdir -p $ARS
    git clone https://github.com/fusion809/arch-scripts $ARS
  fi

  cp -a $ARS/{.bashrc,.zshrc} $HOME/
  cp -a $ARS/Shell $HOME/
  sudo cp -a $ARS/root/Shell /root/Shell
  sudo cp -a $ARS/root/{.bashrc,.zshrc} /root
}

function zshup {
    pushd $HOME/.oh-my-zsh
    git pull --all
    popd
}
