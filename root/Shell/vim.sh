function gvd {
    pushd "$1"
    gvim
    popd
}

function vd {
    pushd "$1"
    vim
    popd
}

function gvsh {
    gvd "$HOME/Shell"
}

function vbash {
    vim "$HOME/.bashrc"
}

function vsh {
    vd "$HOME/Shell"
}

function vvim {
    vim "$HOME/.vimrc"
}

function vzsh {
    vim "$HOME/.zshrc"
}
