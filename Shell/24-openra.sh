pushd -q /data/GitHub/others/OpenRA
git pull origin bleed -q
comnoup=$(git rev-list --count HEAD)
hashup=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
popd -q
pkgverup="${comnoup}.git.${hashup}"

#pkgver=$(ls ~/Applications | grep "Red-Alert" | cut -d '-' -f 4)
pkgver=$(cat $HOME/AUR/openra-wts-git/PKGBUILD | grep "^pkgver=" | cut -d '=' -f 2)

if [[ $pkgverup != $pkgver ]]; then
	echo "OpenRA $pkgverup is available; run openraup to update AppImages"
fi
