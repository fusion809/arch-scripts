# Menus
function cpm {
  sudo cp -a /etc/xdg/menus/{cinnamon,lxde,xfce}-applications.menu $GHUBM/xdg-menus/etc/xdg/menus/
  sudo cp -a /usr/share/desktop-directories/* $GHUBM/xdg-menus/usr/share/desktop-directories/
      cp -a $HOME/.local/share/applications/* $GHUBM/xdg-menus/.local/share/applications/
      cp -a $HOME/.local/share/desktop-directories/* $GHUBM/xdg-menus/.local/share/desktop-directories
      cp -a $HOME/.config/menus/applications-kmenuedit.menu $GHUBM/xdg-menus/.config/menus/
}

function cdme {
  cd $GHUBM/xdg-menus/
}

function mup {
  cpm && cdme && push "$1"
}
