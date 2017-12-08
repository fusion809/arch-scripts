function groot {
    if ! [[ -f /gentoo/proc/config.gz ]]; then
        sudo mount -t proc /proc /gentoo/proc
        sudo mount --rbind /dev /gentoo/dev
        sudo mount --make-rslave /gentoo/dev
        sudo mount --rbind /sys /gentoo/sys
        sudo mount --make-rslave /gentoo/sys
        sudo rm /gentoo/etc/resolv.conf
        sudo cp /etc/resolv.conf /gentoo/etc
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

    sudo chroot /void /usr/local/bin/su-fusion809
}

# Whatever my "other" distro install is
function oroot {
    if ! [[ -f /other/proc/config.gz ]]; then
        sudo mount -t proc /proc /other/proc
        sudo mount --rbind /dev /other/dev
        sudo mount --make-rslave /other/dev
        sudo mount --rbind /sys /other/sys
        sudo mount --make-rslave /other/sys
        sudo rm /other/etc/resolv.conf
        sudo cp /etc/resolv.conf /other/etc
    fi

    if [[ -f /other/usr/local/bin/su-fusion809 ]]; then
         sudo chroot /other /usr/local/bin/su-fusion809
    else
         sudo chroot /other /bin/bash
    fi
}
