function achroot {
  mount /dev/sdb3 /mnt
  mount -t proc /proc /mnt/proc
  mount --rbind /dev /mnt/dev
  mount --rbind /sys /mnt/sys
  mount --rbind /run /mnt/run
  cp /etc/resolv.conf /mnt/et
  chroot /mnt /bin/bash
}

function mchroot {
  mount /dev/sdb1 /mnt
  mount -t proc /proc /mnt/proc
  mount --rbind /dev /mnt/dev
  mount --rbind /sys /mnt/sys
  mount --rbind /run /mnt/run
  cp /etc/resolv.conf /mnt/et
  chroot /mnt /bin/bash
}
