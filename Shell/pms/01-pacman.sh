function pacup {
    sudo pacman -Syu --noconfirm --force
}

function pacin {
    sudo pacman -S $@ --noconfirm --needed
}

function pacinf {
    sudo pacman -S $@ --noconfirm --needed --force
}

function pacinr {
    sudo pacman -S $@ --noconfirm
}

function pacinrf {
    sudo pacman -S $@ --noconfirm --force
}

function pacs {
    sudo pacsearch $@
}

function pacloc {
    if [[ -n $@ ]]; then
         sudo pacman -U $@ --noconfirm --force
    else
         sudo pacman -U *.pkg.tar.xz --noconfirm
    fi
}

function pacrlib {
    unset OUTPUT
    unset FILES
    unset BASE
    OUTPUT=$(sudo pacman -S git --noconfirm --force)
    FILES=$(echo $OUTPUT | sed -n -e 's/^.*File //p' | sed -n -e 's/ is empty, not checked.//p')
    BASE=$(echo $FILES | sed -n -e 's/.so.*/.so/p')
    for i in $BASE
    do
         L=$(sudo pacman -Qo $i)
         sudo pacman -S $(echo $L | sed -n -e 's/^.*by //p' | sed -n -e 's/ .*//p') --noconfirm --force
         unset L
    done
    unset OUTPUT
    unset FILES
    OUTPUT=$(sudo pacman -S git --noconfirm --force)
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
         pacin "$i"
    done
}
