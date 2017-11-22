function vbash {
    vim $HOME/.bashrc
}

function vcp {
    vim *.cpp
}

function ved {
    vim *.ebuild
}

function vgit {
    vim .gitignore
}

function vpk {
    vim PKGBUILD
}

function vrm {
    vim README.md
}

function vsp {
    vim *.spec
}

function vvim {
    vim $HOME/.vimrc
}

alias vrc=vvim

function vx {
    vim $HOME/.xinitrc
}

function vzsh {
    vim $HOME/.zshrc
}

function vnix {
    if [[ -f default.nix ]]; then
         vim default.nix
    else
         vim *.nix
    fi
}

alias vni=vnix
alias vn=vnix
