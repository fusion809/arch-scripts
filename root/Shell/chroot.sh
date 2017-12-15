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

    if [[ -f $1/usr/local/bin/su-fusion809 ]]; then
         chroot $1 /usr/local/bin/su-fusion809
    elif [[ -f $1/bin/zsh ]]; then
         chroot $1 /bin/zsh
    else
         chroot $1 /bin/bash
    fi
}    

function groot {
    genroot /gentoo
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

function vroot {
    genroot /void
}

function oroot {
    genroot /other
}
