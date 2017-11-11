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

function froot {
    if ! [[ -f /fedora/proc/config.gz ]]; then
        sudo mount -t proc /proc /fedora/proc
        sudo mount --rbind /dev /fedora/dev
        sudo mount --make-rslave /fedora/dev
        sudo mount --rbind /sys /fedora/sys
        sudo mount --make-rslave /fedora/sys
        sudo rm /fedora/etc/resolv.conf
        sudo cp /etc/resolv.conf /fedora/etc
    fi

    sudo chroot /fedora /bin/bash
}
