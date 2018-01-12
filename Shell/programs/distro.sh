function distro-func {
    ls -ld /dev/disk/by-label/* | grep -v "sdb1" | grep -v "boot"
}

function distro-count {
    distro-func | wc -l
}

function distro-list {
    distro-func | cut -d '/' -f 5 | cut -d ' ' -f 1 | sed 's/\\x20/ /g'
}

function distro-partition {
    distros=$(distro-list)
    count=$(distro-count)
    partition=$(distro-func | cut -d ' ' -f 11 | cut -d '/' -f 3 | sed 's|sda|/dev/sda|g')
    k=0
    for i in $(seq 1 $count)
    do 
         part=$(echo $partition | head -n $i | tail -n 1)
         distro=$(echo $distros | head -n $i | tail -n 1)
         printf "$distro -> "
         printf '\e[1;36m%-6s\e[m' "$part"
         printf "\n"
    done
}
