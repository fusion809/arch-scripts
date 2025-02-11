function appimrname {
	cd $HOME/Applications
	mv OpenRA-${1/ /-}-devel-x86_64.AppImage OpenRA-${1/ /-}-$2-x86_64.AppImage
}

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
	rm ~/Applications/OpenRA*.AppImage
	cdgo OpenRA
	make clean
	make
	cd packaging/linux
	./buildpackage.sh $upver ~/Applications
	appimrname "Red Alert" $upver
	appimrname "Tiberian Dawn" $upver
	appimrname "Dune 2000" $upver
    fi
}
