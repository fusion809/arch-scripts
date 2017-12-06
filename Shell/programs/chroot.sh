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

# Irrelevant now
#function grroot {
#    if ! [[ -f /gentoo-runit/proc/config.gz ]]; then
#        sudo mount -t proc /proc /gentoo-runit/proc
#        sudo mount --rbind /dev /gentoo-runit/dev
#        sudo mount --make-rslave /gentoo-runit/dev
#        sudo mount --rbind /sys /gentoo-runit/sys
#        sudo mount --make-rslave /gentoo-runit/sys
#        sudo rm /gentoo-runit/etc/resolv.conf
#        sudo cp /etc/resolv.conf /gentoo-runit/etc
#    fi
#
#    sudo chroot /gentoo-runit /usr/local/bin/su-fusion809
#}
