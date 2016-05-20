function schroot {
  sudo mount /dev/sda1 /mnt
  sudo mount -t proc none /mnt/proc
  sudo mount -o bind /dev /mnt/dev
  sudo mount -o bind /sys /mnt/sys
  sudo cp /etc/resolv.conf /mnt/etc/resolv.conf
  sudo mount -o bind /tmp /mnt/tmp
  sudo mount --rbind /dev /mnt/dev
  sudo mount --rbind /sys /mnt/sys
}

function gentoo-chroot {
  sudo cp -a $HOME/Downloads/stage3-amd64-*.tar.bz2 $HOME/gentoo-chroot
  cd $HOME/gentoo-chroot
  sudo tar xvjpf stage3-amd64-*.tar.bz2
  sudo mount -t proc none $HOME/gentoo-chroot/proc
  sudo mount -o bind /dev $HOME/gentoo-chroot/dev
  sudo mkdir usr/portage
  sudo mount -o bind /usr/portage $HOME/gentoo-chroot/usr/portage
  sudo mkdir usr/src/linux
  sudo mount -o bind /usr/src/linux $HOME/gentoo-chroot/usr/src/linux
  sudo mkdir lib/modules
  sudo mount -o bind /lib/modules $HOME/gentoo-chroot/lib/modules
  sudo mount -o bind /sys $HOME/gentoo-chroot/sys
  sudo cp /etc/resolv.conf $HOME/gentoo-chroot/etc/resolv.conf
  sudo mount -o bind /tmp $HOME/gentoo-chroot/tmp
  sudo mount --rbind /dev $HOME/gentoo-chroot/dev
  sudo mount --rbind /sys $HOME/gentoo-chroot/sys
}

function gentoo-mnt {
  sudo mount -t proc none $HOME/gentoo-chroot/proc
  sudo mount -o bind /dev $HOME/gentoo-chroot/dev
  sudo mkdir usr/portage
  sudo mount -o bind /usr/portage $HOME/gentoo-chroot/usr/portage
  sudo mkdir usr/src/linux
  sudo mount -o bind /usr/src/linux $HOME/gentoo-chroot/usr/src/linux
  sudo mkdir lib/modules
  sudo mount -o bind /lib/modules $HOME/gentoo-chroot/lib/modules
  sudo mount -o bind /sys $HOME/gentoo-chroot/sys
  sudo cp /etc/resolv.conf $HOME/gentoo-chroot/etc/resolv.conf
  sudo mount -o bind /tmp $HOME/gentoo-chroot/tmp
  sudo mount --rbind /dev $HOME/gentoo-chroot/dev
  sudo mount --rbind /sys $HOME/gentoo-chroot/sys
}

function gentoo-umnt {
  sudo umount $HOME/gentoo-chroot/proc
  sudo umount $HOME/gentoo-chroot/dev
  sudo umount $HOME/gentoo-chroot/usr/portage
  sudo umount $HOME/gentoo-chroot/usr/src/linux
  sudo umount $HOME/gentoo-chroot/lib/modules
  sudo umount $HOME/gentoo-chroot/sys
  sudo umount $HOME/gentoo-chroot/tmp
  sudo umount $HOME/gentoo-chroot/dev
  sudo umount $HOME/gentoo-chroot/sys
}

function groot {
  sudo chroot $HOME/gentoo-chroot /bin/bash
}

function aroot {
  sudo chroot $HOME/chroot /bin/bashup
}
