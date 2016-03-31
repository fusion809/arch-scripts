# Menus
function cpm {
  sudo cp -a /etc/xdg/menus/{cinnamon,lxde,xfce}-applications.menu /home/fusion809/GitHub/xdg-menus/etc/xdg/menus/
  sudo cp -a /usr/share/desktop-directories/* /home/fusion809/GitHub/xdg-menus/usr/share/desktop-directories/
      cp -a ~/.local/share/applications/* ~/GitHub/xdg-menus/.local/share/applications/
      cp -a ~/.local/share/desktop-directories/* ~/GitHub/xdg-menus/.local/share/desktop-directories
      cp -a ~/.config/menus/applications-kmenuedit.menu ~/GitHub/xdg-menus/.config/menus/
}

function cdm {
  cd /home/fusion809/GitHub/xdg-menus/
}

function mup {
  cpm && cdm && push "$1"
}
