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
