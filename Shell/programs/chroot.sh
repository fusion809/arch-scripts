function genroot {
    if [[ -d $1/root/dev ]]; then
         root="$1/root"
    elif [[ -d $1/@/dev ]]; then
         root="$1/@"
    else
         root="$1"
    fi

    if ! [[ -f "$root/proc/cgroups" ]]; then
         sudo mount -t proc /proc "$root/proc"
         sudo mount --rbind /dev "$root/dev"
         sudo mount --make-rslave "$root/dev"
         sudo mount --rbind /sys "$root/sys"
         sudo mount --make-rslave "$root/sys"
         sudo rm "$root/etc/resolv.conf"
         sudo cp -L /etc/resolv.conf "$root/etc"
    fi

    if [[ -f $root/bin/env ]]; then
         ENV=/bin/env
    elif [[ -f $root/usr/bin/env ]]; then
         ENV=/usr/bin/env
    fi
                   #PS1="($1 chroot) $PS1"    \
    if [[ -f $root/usr/local/bin/su-fusion809 ]]; then
         sudo chroot "$root" /usr/local/bin/su-fusion809
    elif [[ -f $root/bin/zsh ]]; then
         sudo chroot "$root" $ENV -i     \
               HOME="/root"              \
               TERM="$TERM"              \
               PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin \
               /bin/zsh --login +h
    elif [[ -f $root/bin/bash ]]; then
         sudo chroot "$root" $ENV -i     \
               HOME="/root"              \
               TERM="$TERM"              \
               PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin \
               /bin/bash --login +h
    elif [[ -f $root/bin/sh ]] && [[ -n $ENV ]]; then
         sudo chroot "$root" $ENV -i     \
               HOME="/root"              \
               TERM="$TERM"              \
               PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin \
               /bin/sh --login +h
    elif [[ -f $root/bin/sh ]] || [[ -L $root/bin/sh ]]; then
         sudo chroot "$root" /bin/sh
    else
         printf "I'm missing a shell, mate!"
    fi

    if [[ -f $root/usr/bin/dnf ]]; then
         sudo touch "$root/.autorelabel"
    fi
}

function groot {
    if ! [[ -f /gentoo/bin/bash ]]; then
         sudo mount /dev/sda4 /gentoo
    fi

    if ! [[ -d /gentoo/data/Programs ]]; then
         sudo mount /dev/sdb1 /gentoo/data
    fi
    genroot /gentoo
}

function vroot {
    if ! [[ -f /void/bin/bash ]]; then
         sudo mount /dev/sda11 /void
    fi

    if ! [[ -d /void/data/Programs ]]; then
         sudo mount /dev/sdb1 /void/data
    fi
    genroot /void
}

function sroot {
    if ! [[ -f /slackware/bin/bash ]]; then
         sudo mount /dev/sda16 /slackware
    fi

    if ! [[ -d /slackware/data/Programs ]]; then
         sudo mount /dev/sdb1 /slackware/data
    fi
    genroot /slackware
}

function oroot {
    genroot /opensuse
}

function droot {
    genroot /debian
}

function duroot {
    genroot /debian-unstable
}

function mroot {
    genroot /mageia
}

function dproot {
    genroot /deepin
}

function lroot {
    genroot /linuxmint
}

function nroot {
    genroot /neon
}

function proot {
    genroot /pclinuxos
}

function froot {
    printf "Warning! You are doing a Fedora chroot here mate... \nFedora uses SELinux so you should run touch /fedora/root/.autorelabel after you're finished in the chroot!"
    genroot /fedora
}

function uroot {
    genroot /ubuntu
}
