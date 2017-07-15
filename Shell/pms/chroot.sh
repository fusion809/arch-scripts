function syncup {
    if ! [[ -f /proc/config.gz ]]; then
         sudo mount -t proc /proc /gentoo/proc
         sudo mount --rbind /dev /gentoo/dev
         sudo mount --make-rslave /gentoo/dev
         sudo mount --rbind /sys /gentoo/sys
         sudo mount --make-rslave /gentoo/sys
         sudo cp -L /etc/resolv.conf /gentoo/etc
    fi
    sudo chroot /gentoo /usr/local/bin/syncup-chroot
}

function vimupd {
    sudo chroot /gentoo /usr/local/bin/vimupd
}

function vimup {
        vimupd
        printf '\e[1;34m%-0s\e[m' "Running ovimup vim."
        printf "\n"
        ovimup vim
        printf '\e[1;34m%-0s\e[m' "Running ovimup vim-suse."
        printf "\n"
        ovimup "vim-suse"
        printf '\e[1;34m%-0s\e[m' "Running ovimup vim-redhat."
        printf "\n"
        ovimup "vim-redhat"
}
