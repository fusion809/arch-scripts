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
