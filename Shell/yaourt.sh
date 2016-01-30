function yaset {
  sudo pacman -Sy git
  git clone https://aur.archlinux.org/package-query.git
  cd package-query
  makepkg -si --noconfirm
  cd ..
  git clone https://aur.archlinux.org/yaourt.git
  cd yaourt
  makepkg -si --noconfirm
  cd ..
}

function yain {
	trizen -Sy $@ --noconfirm --needed --force
}

function yarm {
	trizen -Rsc $@ --noconfirm
}

function update {
	trizen -Syu --noconfirm --needed
	if hash apm 2>/dev/null; then
		apmup
	fi
}

alias yaup=update

function updatev {
	update
	pushd /home/fusion809/GitHub/PKGBUILDs
        ./update-vim.sh
        popd
}
