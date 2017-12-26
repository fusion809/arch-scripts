function genroot {
    if [[ -d $1/root/dev ]]; then
         root="$1/root"
    else
         root="$1"
    fi

    if ! [[ -f "$root/proc/config.gz" ]]; then
         sudo mount -t proc /proc "$root/proc"
         sudo mount --rbind /dev "$root/dev"
         sudo mount --make-rslave "$root/dev"
         sudo mount --rbind /sys "$root/sys"
         sudo mount --make-rslave "$root/sys"
         sudo rm "$root/etc/resolv.conf"
         sudo cp -L /etc/resolv.conf "$root/etc"
    fi

    if [[ -f $root/usr/local/bin/su-fusion809 ]]; then
         sudo chroot "$root" /usr/local/bin/su-fusion809
    elif [[ -f $root/bin/zsh ]]; then
         sudo chroot "$root" /bin/zsh
    else  
         sudo chroot "$root" /bin/bash
    fi

    if [[ -f $root/usr/bin/dnf ]]; then
         sudo touch "$root/.autorelabel"
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

function dproot {
    genroot /deepin
}

function dbroot {
    genroot /debian
}
