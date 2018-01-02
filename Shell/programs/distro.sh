function distro-count {
    ls -ld /dev/disk/by-label/* | grep -v "sdb1" | grep -v "boot" | wc -l
}

function distro-list {
    ls -ld /dev/disk/by-label/* | grep -v "sdb1" | grep -v "boot" | cut -d '/' -f 5 | cut -d ' ' -f 1 | sed 's/\\x20/ /g'
}
