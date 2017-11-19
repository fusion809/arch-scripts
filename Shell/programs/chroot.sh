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

function vroot {
    if ! [[ -f /void/proc/config.gz ]]; then
        sudo mount -t proc /proc /void/proc
        sudo mount --rbind /dev /void/dev
        sudo mount --make-rslave /void/dev
        sudo mount --rbind /sys /void/sys
        sudo mount --make-rslave /void/sys
        sudo rm /void/etc/resolv.conf
        sudo cp /etc/resolv.conf /void/etc
    fi

    sudo chroot /void /bin/bash
}
