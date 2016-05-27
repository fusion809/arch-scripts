function cpai {
  sudo rm -rf /root/{archlive,customrepo}
  sudo cp -a $GHUBM/archiso/{archlive,customrepo} /root/
}
