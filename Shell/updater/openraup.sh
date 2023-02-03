function openraup {
    cdgo OpenRA
    git pull origin bleed
    upno=$(git rev-list --count HEAD)
    uphash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    upver="${upno}.git.${uphash}"
    pkgver=$(cat PKGBUILD | grep "^pkgver=" | cut -d '=' -f 2)

    if [[ $upver != $pkgver ]]; then
        cda openra-wts-git
        makepkg -sifC --noconfirm
        rm *.zst
    fi
}