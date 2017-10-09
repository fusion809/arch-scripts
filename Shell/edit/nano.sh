# bashrc
function nbash {
    nano $HOME/.bashrc
}

function ndc {
    nano Dockerfile
}

function nde {
    nano *.desktop
}

function ndi {
    nano *.install
}

# emacs config
function nem {
    nano $HOME/.emacs
}

# gitignore
function ngit {
    nano .gitignore
}

function nlic {
    if [[ -f LICENSE* ]]; then
         nano LICENSE*
    elif [[ -f License* ]]; then
         nano License*
    fi
}

function npc {
    sudo nano /etc/pacman.conf
}

function nps {
    sudo nano /etc/sddm.conf
}

# PKGBUILD/package.json
function npk {
    if [[ -f PKGBUILD ]];     then
         nano PKGBUILD
    fi

    if [[ -f package.json ]]; then
         nano package.json
    elif ! [[ -f PKGBUILD ]]; then
         printf "No PKGBUILD or package.json found in $PWD!"
    fi
}

function nrm {
    nano README.md
}

# spacemacs config
function nsp {
    nano $HOME/.spacemacs
}

# xinitrc
function nx {
    nano $HOME/.xinitrc
}

# vimrc - navim is what it should be called it nvim is installed
if ! [[ -f /usr/bin/nvim ]]; then
    function nvim {
         nano $HOME/.vimrc
    }
else
    function navim {
         nano $HOME/.vimrc
    }
fi

# zshrc
function nzsh {
  nano $HOME/.zshrc
}
