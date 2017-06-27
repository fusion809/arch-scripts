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

# - .config
function cdc {
	cd $HOME/.config/$1
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

function cdlt {
	cd $LS/themes/$1
}

function cdth {
	cd $TH/$1
}

function cdi3 {
	cd $HOME/.i3
}
