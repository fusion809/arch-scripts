function cdis {
    cd /data/"VirtualBox VMs"/ISOs/$1
}

alias cdvi=cdis

function diso {
    ISO=$(/bin/find /data/"VirtualBox VMs"/ISOs -name "$1")
    if ! [[ -n "$2" ]]; then
         /bin/dd if="$ISO" of=/dev/sdc bs=4M status=progress && sync
    else
         /bin/dd if="$ISO" of=/dev/sd"$2" bs=4M status=progress && sync
    fi
}
