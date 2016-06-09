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
function pacis {
  for i in "$@"
  do
    if ! [[ ${i: -11} == ".pkg.tar.xz" ]]; then
      pacman -Qi $i | sed -n 's/Installed Size\s*:\s//p'
    else
      pacman -Qip $i | sed -n 's/Installed Size\s*:\s//p'
    fi
  done
}

# Name of package
function paciname {
  for i in "$@"
  do
    if ! [[ ${i: -11} == ".pkg.tar.xz" ]]; then
      INFO=$(pacman -Qi $i)
      NAME=$(printf $INFO | sed -n 's/Name\s*:\s//p')
      VER=$(printf $INFO | sed -n 's/Version\s*:\s//p')
      ARCH=$(printf $INFO | sed -n 's/Architecture\s*:\s//p')
      printf "$NAME-$VER-$ARCH.pkg.tar.xz\n"
    else
      INFO=$(pacman -Qip $i)
      NAME=$(printf $INFO | sed -n 's/Name\s*:\s//p')
      VER=$(printf $INFO | sed -n 's/Version\s*:\s//p' )
      ARCH=$(printf $INFO | sed -n 's/Architecture\s*:\s//p')
      printf "$NAME-$VER-$ARCH.pkg.tar.xz\n"
    fi
  done
}

# Show package's installed size beside its name
function pacisn {
  for i in "$@"
  do
    if ! [[ ${i: -11} == ".pkg.tar.xz" ]]; then
      INFO=$(pacman -Qi $i)
      INS=$(printf $INFO | sed -n 's/Installed Size\s*:\s//p')
      NAME=$(printf $INFO | sed -n 's/Name\s*:\s//p')
      VER=$(printf $INFO | sed -n 's/Version\s*:\s//p')
      ARCH=$(printf $INFO | sed -n 's/Architecture\s*:\s//p')
      printf "$NAME-$VER-$ARCH.pkg.tar.xz has an installed size of $INS\n"
    else
      INFO=$(pacman -Qip $i)
      INS=$(printf $INFO | sed -n 's/Installed Size\s*:\s//p')
      NAME=$(printf $INFO | sed -n 's/Name\s*:\s//p')
      VER=$(printf $INFO | sed -n 's/Version\s*:\s//p')
      ARCH=$(printf $INFO | sed -n 's/Architecture\s*:\s//p')
      printf "$NAME-$VER-$ARCH.pkg.tar.xz has an installed size of $INS\n"
    fi
  done
}
