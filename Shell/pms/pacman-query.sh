# Search
function pacs {
	pacsearch $@
}

# Show installed files for a package
function pacif {
  for i in "$@"
  do
    if ! [[ ${i: -11} == ".pkg.tar.xz" ]]; then
      pacman -Ql $i
    else
      pacman -Qlp $i
    fi
  done
}

# Show installed files in the /bin, /sbin, /usr/bin, /usr/sbin directories
function pacifb {
  for i in "$@"
  do
    if ! [[ ${i: -11} == ".pkg.tar.xz" ]]; then
      pacman -Ql $i | grep " /bin/[a-zA-Z0-9]" | sed -n 's/.* //p'
      pacman -Ql $i | grep " /sbin/[a-zA-Z0-9]" | sed -n 's/.* //p'
      pacman -Ql $i | grep "/usr/bin/[a-zA-Z0-9]" | sed -n 's/.* //p'
      pacman -Ql $i | grep "/usr/sbin/[a-zA-Z0-9]" | sed -n 's/.* //p'
    else
      pacman -Qlp $i | grep " /bin/[a-zA-Z0-9]" | sed -n 's/.* //p'
      pacman -Qlp $i | grep " /sbin/[a-zA-Z0-9]" | sed -n 's/.* //p'
      pacman -Qlp $i | grep "/usr/bin/[a-zA-Z0-9]" | sed -n 's/.* //p'
      pacman -Qlp $i | grep "/usr/sbin/[a-zA-Z0-9]" | sed -n 's/.* //p'
    fi
  done
}

# Show package's installed size
# Show installed files for a package
function pacif {
  for i in "$@"
  do
    if ! [[ ${i: -11} == ".pkg.tar.xz" ]]; then
      pacman -Qi $i | sed -n 's/Installed Size\s*:\s//p'
    else
      pacman -Qip $i | sed -n 's/Installed Size\s*:\s//p'
    fi
  done
}
