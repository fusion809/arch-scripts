# file system structure
# $HOME/
# - .atom
function cdat {
    cd $HOME/.atom/$1
}

# - .atom/packages
function cdatp {
    cd $HOME/.atom/packages/$1
}

# - .cache
function cdca {
    cd $HOME/.cache/$1
}

# - .config/pacaur
function cdpc {
    cdca "pacaur/$1"
}

alias cdcp=cdpc

# - .config
function cdc {
    cd $HOME/.config/$1
}

# - .config/awesome
function cdaw {
    cdc "awesome/$1"
}

# - .config/menus
function cdmen {
    cd $HOME/.config/menus/
}

# - .config/sway
function cdsw {
    cdc "sway/$1"
}

#	- .local/share
function cdls {
    cd $LS/$1
}

# -- applications
function cdap {
    cd $AP/$1
}

# -- plasma/desktoptheme
function cdpd {
    cd $PD
}

function cdpq {
    cd $PQ
}

function cdapa {
    cdap atom
}

function cdvap {
    cdap virtualbox
}

##########################
function cddd {
    cd $DD
}

function cdi {
    cd $LS/icons/$1
}

alias cdli=cdi

function cdlt {
    cd $LS/themes/$1
}

function cdth {
    cd $TH/$1
}

function cdlsw {
    cd $LS/wallpapers/$1
}

function cdi3 {
    cd $HOME/.i3
}

function cddvm {
    cd $HOME/.VirtualBox/Machines/$1
}
