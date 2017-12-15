#function achroot {
#    mount /dev/sdb3 /mnt
#    mount -t proc /proc /mnt/proc
#    mount --rbind /dev /mnt/dev
#    mount --rbind /sys /mnt/sys
#    mount --rbind /run /mnt/run
#    cp /etc/resolv.conf /mnt/et
#    chroot /mnt /bin/bash
#}

#function mchroot {
#    mount /dev/sdb1 /mnt
#    mount -t proc /proc /mnt/proc
#    mount --rbind /dev /mnt/dev
#    mount --rbind /sys /mnt/sys
#    mount --rbind /run /mnt/run
#    cp /etc/resolv.conf /mnt/et
#    chroot /mnt /bin/bash
#}

function groot {
    if ! [[ -f /gentoo/proc/config.gz ]]; then
         mount -t proc /proc /gentoo/proc
         mount --rbind /dev /gentoo/dev
         mount --make-rslave /gentoo/dev
         mount --rbind /sys /gentoo/sys
         mount --make-rslave /gentoo/sys
         rm /gentoo/etc/resolv.conf
         cp /etc/resolv.conf /gentoo/etc
         chroot /gentoo /usr/local/bin/md
    fi

    chroot /gentoo /usr/local/bin/su-fusion809
}

export LFS=/mnt/lfs

#function lfsroot {
#	if ! [[ -d $LFS/bin ]]; then
#		mount /dev/sdb2 $LFS
#	fi
#	if ! [[ -f $LFS/proc/keys ]]; then
#		mount -t proc none $LFS/proc 
#	fi
#	if ! [[ -f $LFS/dev/net ]]; then
#		mount --rbind /dev $LFS/dev && \ 
#	        mount --make-rslave $LFS/dev
#	fi
#	if ! [[ -d $LFS/sys/cgroup ]]; then
#		mount --rbind /sys $LFS/sys && \
#		mount --make-rslave $LFS/sys
#	fi
#	chroot $LFS /usr/bin/env -i HOME=/root TERM="$TERM" PS1='\u:\w\$ ' PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/zsh --login
#}

function genroot {
    if ! [[ -f "$1/proc/config.gz" ]]; then
         mount -t proc /proc "$1/proc"
         mount --rbind /dev "$1/dev"
         mount --make-rslave "$1/dev"
         mount --rbind /sys "$1/sys"
         mount --make-rslave "$1/sys"
         rm "$1/etc/resolv.conf"
         cp -L /etc/resolv.conf "$1/etc"
    fi

    if ! [[ -n $2 ]]; then
         chroot $1 $2
    else
         chroot "$1" /bin/bash
    fi
}    

function vroot {
    genroot /void /usr/local/bin/su-fusion809
}

function oroot {
    genroot /other /usr/local/bin/su-fusion809
}
