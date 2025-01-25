pushd -q /data/GitHub/others/OpenRA
git pull origin bleed -q
comnoup=$(git rev-list --count HEAD)
hashup=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
popd -q
pkgverup="${comnoup}.git.${hashup}"

pkgver=$(ls ~/ | grep "Red-Alert" | cut -d '-' -f 4)

if [[ $pkgverup != $pkgver ]]; then
	echo "OpenRA $pkgverup is available; run openraup to update AppImages"
fi
