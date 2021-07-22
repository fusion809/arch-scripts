function pcas {
    sudo du -sh /var/cache/pacman/pkg
}

alias pacman_cache_size=pcas

function pacup {
    sudo pacman -Syu --noconfirm
}

function pacin {
    sudo pacman -S $@ --noconfirm --needed
}

function pacinf {
    sudo pacman -S $@ --noconfirm --needed
}

function pacinr {
    sudo pacman -S $@ --noconfirm
}

function pacinrf {
    sudo pacman -S $@ --noconfirm
}

function pacs {
    sudo pacsearch $@
}

function pacloc {
    if [[ -n $@ ]]; then
         sudo pacman -U $@ --noconfirm
    else
        latest_package=$(ls | grep ".pkg.tar.zst" | tail -n 1)
        sudo pacman -U ${latest_package} --noconfirm
    fi
}

function pacrlib {
    unset OUTPUT
    unset FILES
    unset BASE
    OUTPUT=$(sudo pacman -S git --noconfirm)
    FILES=$(echo $OUTPUT | sed -n -e 's/^.*File //p' | sed -n -e 's/ is empty, not checked.//p')
    BASE=$(echo $FILES | sed -n -e 's/.so.*/.so/p')
    for i in $BASE
    do
         L=$(sudo pacman -Qo $i)
         sudo pacman -S $(echo $L | sed -n -e 's/^.*by //p' | sed -n -e 's/ .*//p') --noconfirm
         unset L
    done
    unset OUTPUT
    unset FILES
    OUTPUT=$(sudo pacman -S git --noconfirm)
    FILES=$(echo $OUTPUT | sed -n -e 's/^.*File //p' | sed -n -e 's/ is empty, not checked.//p')
    sudo rm $FILES
}

# list all installed packages, foreign and native
function pacl {
    pacman -Q"$1" | cut -d ' ' -f 1
}

# list all foreign packages
function paclm {
    pacl m
}

# list all native packages
function pacln {
    pacl n
}

# pacman reinstall all native packages
function pacrin {
    for i in $(pacln)
    do
         sudo pacman -S "$i" --noconfirm
    done
}

function pacsize {
    pacman -Qi "$@" | grep "Installed Size" | cut -d ':' -f 2 | sed 's/\s*//g'
}

function pacsin {
    for i in $@
    do
         SIZE=$(pacsize $i)
         printf "$i $SIZE\n"
    done
}

function list_packages_by_size {
    expac "%n %m" -l'\n' -Q $(pacman -Qq) | sort -rhk 2 | less
}

alias pacliss=list_packages_by_size
alias pacls=list_packages_by_size

function pacinfo {
    pacman -Qi "$@"
}

alias pacdesc=pacinfo 
alias pacd=pacinfo
