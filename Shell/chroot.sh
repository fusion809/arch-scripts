function gentoo-chroot {
  sudo cp -a ~/Downloads/stage3-amd64-*.tar.bz2 ~/gentoo-chroot
  cd ~/gentoo-chroot
  sudo tar xvjpf stage3-amd64-*.tar.bz2
  sudo mount -t proc none ~/gentoo-chroot/proc
  sudo mount -o bind /dev ~/gentoo-chroot/dev
  sudo mkdir usr/portage
  sudo mount -o bind /usr/portage ~/gentoo-chroot/usr/portage
  sudo mkdir usr/src/linux
  sudo mount -o bind /usr/src/linux ~/gentoo-chroot/usr/src/linux
  sudo mkdir lib/modules
  sudo mount -o bind /lib/modules ~/gentoo-chroot/lib/modules
  sudo mount -o bind /sys ~/gentoo-chroot/sys
  sudo cp /etc/resolv.conf ~/gentoo-chroot/etc/resolv.conf
  sudo mount -o bind /tmp ~/gentoo-chroot/tmp
  sudo mount --rbind /dev ~/gentoo-chroot/dev
  sudo mount --rbind /sys ~/gentoo-chroot/sys
}

function gentoo-mnt {
  sudo mount -t proc none ~/gentoo-chroot/proc
  sudo mount -o bind /dev ~/gentoo-chroot/dev
  sudo mkdir usr/portage
  sudo mount -o bind /usr/portage ~/gentoo-chroot/usr/portage
  sudo mkdir usr/src/linux
  sudo mount -o bind /usr/src/linux ~/gentoo-chroot/usr/src/linux
  sudo mkdir lib/modules
  sudo mount -o bind /lib/modules ~/gentoo-chroot/lib/modules
  sudo mount -o bind /sys ~/gentoo-chroot/sys
  sudo cp /etc/resolv.conf ~/gentoo-chroot/etc/resolv.conf
  sudo mount -o bind /tmp ~/gentoo-chroot/tmp
  sudo mount --rbind /dev ~/gentoo-chroot/dev
  sudo mount --rbind /sys ~/gentoo-chroot/sys
}

function gentoo-umnt {
  sudo umount ~/gentoo-chroot/proc
  sudo umount ~/gentoo-chroot/dev
  sudo umount ~/gentoo-chroot/usr/portage
  sudo umount ~/gentoo-chroot/usr/src/linux
  sudo umount ~/gentoo-chroot/lib/modules
  sudo umount ~/gentoo-chroot/sys
  sudo umount ~/gentoo-chroot/tmp
  sudo umount ~/gentoo-chroot/dev
  sudo umount ~/gentoo-chroot/sys
}

function groot {
  sudo chroot ~/gentoo-chroot /bin/bash
}

function aroot {
  sudo chroot ~/chroot /bin/bashup
}
