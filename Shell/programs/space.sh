function datsp {
    df -h /dev/sdb1
}

function space {
    sudo btrfs fi show | head -n 3 | grep "devid" | cut -d ' ' -f 9
}
