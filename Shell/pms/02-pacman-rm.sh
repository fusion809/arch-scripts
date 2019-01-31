# Remove list of specified packages
function pacrm {
    sudo pacman -Rs $@ --noconfirm
}

# Forcibly removed all specified packages
function pacrma {
    sudo pacman -Rsc $@ --noconfirm
} 

# Equiv to APT's autoremove
function pacar {
    pacrm $(pacman -Qdtq)
}

alias autoremove=pacar
