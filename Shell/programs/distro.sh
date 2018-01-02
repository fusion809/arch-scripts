function distro-count {
    ls -ld /dev/disk/by-label/* | grep -v "sdb1" | grep -v "boot" | wc -l
}
