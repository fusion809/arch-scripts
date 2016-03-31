## Update local arch-scripts repo
function cps {
  cp -a ~/Shell/* ~/GitHub/arch-scripts/Shell
  cp -a ~/{.bashrc,.zshrc} ~/GitHub/arch-scripts/
  sudo cp -a /root/{Shell,.bashrc,.zshrc} ~/GitHub/arch-scripts/root/
}

function cdas {
cd ~/GitHub/arch-scripts
}

## Update sabayon-scripts GitHub repo
function shup {
  cps && cdas && push "$1" && cd -
}
