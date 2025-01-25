function openraup {
    cdgo OpenRA
    git pull origin bleed
    upno=$(git rev-list --count HEAD)
    uphash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    upver="${upno}.git.${uphash}"
    #pkgver=$(cat $HOME/AUR/openra-wts-git/PKGBUILD | grep "^pkgver=" | cut -d '=' -f 2)
    pkgver=$(cat /mnt/d/GitHub/others/OpenRA/VERSION)

    if [[ $upver != $pkgver ]]; then
        #cda openra-wts-git
        #makepkg -sifC --noconfirm
        #rm *.zst
	rm ~/OpenRA*.AppImage
	cdgo OpenRA
	make clean
	make
	cd packaging/linux
	./buildpackage.sh $upver ~/
	mv ~/OpenRA-Red-Alert-devel-x86_64.AppImage ~/OpenRA-Red-Alert-$upver-x86_64.AppImage
	mv ~/OpenRA-Dune-2000-devel-x86_64.AppImage ~/OpenRA-Dune-2000-$upver-x86_64.AppImage
	mv ~/OpenRA-Tiberian-Dawn-devel-x86_64.AppImage ~/OpenRA-Tiberian-Dawn-$upver-x86_64.AppImage
    fi
}
