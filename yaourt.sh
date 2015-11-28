cd package-query
makepkg -s && sudo pacman -U *.pkg.tar.xz --noconfirm
cd ../yaourt
makepkg -s && sudo pacman -U *.pkg.tar.xz --noconfirm

