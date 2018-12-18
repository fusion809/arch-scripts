# pacaur commands
# pacaur has been removed from the AUR as of 19 Dec 2018
# install package
function pacain {
  pacaur -S "$@" --noconfirm --needed --noedit
}

# remove package and reverse-dependencies
function pacarm {
  pacaur -Rsc "$@" --noconfirm
}

# search for a regex in package name/description
function pacas {
  if [[ "$@" == "-h" ]] || [[ "$@" == "--help" ]] || [[ "$@" == "-help" ]]; then
    printf "This function searches the AUR and enabled Arch Linux repositories for the provided regex using pacaur.\n"
  else
    pacaur -Ss "$@"
  fi
}

function pacasa {
  if [[ "$@" == "-h" ]] || [[ "$@" == "--help" ]] || [[ "$@" == "-help" ]]; then
    printf "This function searches the AUR for the provided regex using pacaur.\n"
  else
    pacaur -Ssa "$@"
  fi
}

function pacaup {
  pacaur -Syu --noconfirm --noedit
}
