function genroot {
    if ! [[ -f "$1/proc/config.gz" ]]; then
         sudo mount -t proc /proc "$1/proc"
         sudo mount --rbind /dev "$1/dev"
         sudo mount --make-rslave "$1/dev"
         sudo mount --rbind /sys "$1/sys"
         sudo mount --make-rslave "$1/sys"
         sudo rm "$1/etc/resolv.conf"
         sudo cp -L /etc/resolv.conf "$1/etc"
    fi

    if [[ -f $1/usr/local/bin/su-fusion809 ]]; then
         sudo chroot "$1" /usr/local/bin/su-fusion809
    elif [[ -f $1/bin/zsh ]]; then
         sudo chroot "$1" /bin/zsh
    else  
         sudo chroot "$1" /bin/bash
    fi
}

function groot {
    genroot /gentoo
}

function vroot {
    genroot /void
}

# Whatever my "other" distro install is
function oroot {
    genroot /other
}
