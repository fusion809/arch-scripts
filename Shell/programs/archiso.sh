function cpai {
  sudo rm -rf /root/{archlive,customrepo}
  sudo cp -a $HOME/GitHub/archiso/{archlive,customrepo} /root/
}
