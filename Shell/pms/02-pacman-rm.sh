# Equivalent to autoremove
function pacar {
    pacman -Qdtq | sudo pacman -Rs -
}

alias autoremove=pacar

# Remove list of specified packages
function pacrm {
    sudo pacman -Rs $@ --noconfirm
}

# Forcibly removed all specified packages
function pacrma {
    sudo pacman -Rsc $@ --noconfirm
}
