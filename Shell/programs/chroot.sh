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

function mroot {
    if ! [[ -f /mint/proc/config.gz ]]; then
        sudo mount -t proc /proc /mint/proc
        sudo mount --rbind /dev /mint/dev
        sudo mount --make-rslave /mint/dev
        sudo mount --rbind /sys /mint/sys
        sudo mount --make-rslave /mint/sys
        sudo rm /mint/etc/resolv.conf
        sudo cp /etc/resolv.conf /mint/etc
    fi

    sudo chroot /mint /bin/bash
}
