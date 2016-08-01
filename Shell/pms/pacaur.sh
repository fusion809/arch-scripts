# pacaur commands
# install package
function pacain {
  pacaur -S "$@" --noconfirm --needed
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
