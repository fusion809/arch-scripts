function yaar {
  yaourt -Qdtq | yaourt -Rs -
}

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
	yaourt -S $@ --noconfirm --needed
}

function yainw {
  yain $(yaourt -Ssq $@)
}

function yasw {
  yaourt -Ssq $@
}

function yarm {
	yaourt -Rsc $@ --noconfirm
}

function update {
	yaourt -Syua --noconfirm --needed
	if hash apm 2>/dev/null; then
		apmup
	fi
  vimups
  blockup
}

function yaup {
  yaourt -Syua --noconfirm --needed
  apmup
}

function yarin {
  for i in $(pacman -Q | cut -d' ' -f1)
  do
  	yaourt -Sy $i --noconfirm --force
  done
}
