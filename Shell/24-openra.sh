cdgo OpenRA
git pull origin bleed
comnoup=$(git rev-list --count HEAD)
hashup=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
pkgverup="${comnoup}.git.${hashup}"

pkgver=$(cat $HOME/AUR/openra-wts-git/PKGBUILD | grep '^pkgver=' | cut -d '=' -f 2)

if [[ $pkgverup != $pkgver ]]; then
	echo "OpenRA $pkgverup is available; run openraup to update openra-wts-git"
fi
