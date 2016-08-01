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

# Search for keyword in the name or description of a package
function yas {
  printf "This function is no longer recommended as it does not search the AUR for the regex provided. If you want to search the AUR and enabled package repositories use the pacas function!\n"
  yaourt -Ss "$@"
}

# Search for a package (wildcard character *, supported)
function yasw {
  yaourt -Ssq $@
}

# Remove a package
function yarm {
	yaourt -Rsc $@ --noconfirm
}

function update {
  vimup
  blockup
	pacaup
	if hash apm 2>/dev/null; then
		apmbup
	fi
}

# Upgrade all Yaourt packages and Atom packages
function yaup {
  yaourt -Syua --noconfirm --needed
}

# Reinstall all packages using Yaourt
function yarin {
  for i in $(pacman -Q | cut -d' ' -f1)
  do
  	yaourt -Sy $i --noconfirm --force
  done
}
