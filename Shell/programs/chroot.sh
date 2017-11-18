function groot {
    if ! [[ -f /gentoo/proc/config.gz ]]; then
        sudo mount -t proc /proc /gentoo/proc
        sudo mount --rbind /dev /gentoo/dev
        sudo mount --make-rslave /gentoo/dev
        sudo mount --rbind /sys /gentoo/sys
        sudo mount --make-rslave /gentoo/sys
        sudo rm /gentoo/etc/resolv.conf
        sudo cp /etc/resolv.conf /gentoo/etc
        sudo chroot /gentoo /usr/local/bin/md
    fi

    sudo chroot /gentoo /usr/local/bin/su-fusion809
}

function nroot {
    if ! [[ -f /other/proc/config.gz ]]; then
        sudo mount -t proc /proc /other/proc
        sudo mount --rbind /dev /other/dev
        sudo mount --make-rslave /other/dev
        sudo mount --rbind /sys /other/sys
        sudo mount --make-rslave /other/sys
        sudo rm /other/etc/resolv.conf
        sudo cp /etc/resolv.conf /other/etc
    fi

    sudo chroot /other /bin/bash
}
