sudo pacman -Sy git
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -s && sudo pacman -U *.pkg.tar.xz --noconfirm
git clone https://aur.archlinux.org/yaourt.git
cd ../yaourt
makepkg -s && sudo pacman -U *.pkg.tar.xz --noconfirm
