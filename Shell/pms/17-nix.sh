function nixi {
    sudo nix-env -i "$1"
}

function nixr {
    sudo nix-env -e "$1"
}

function nixs {
    sudo nix-env -qa "$1"
}

function nixup {
    sudo nix-channel --update && sudo nix-env --upgrade
}

function nixupc {
    if hash nix-env 2>/dev/null; then
         nixup
    fi
}
