# file system structure
# $HOME/
# - .atom
function cdat {
	echo "Use pushat for this repo"
	cd $HOME/.atom
}

# - .config/menus
function cdmen {
	cd $HOME/.config/menus/
}

#	- .local/share
function cdpd {
	cd $PD
}

function cdpq {
	cd $PQ
}

# -- applications
function cdap {
	cd $HOME/.local/share/applications
}

function cdapa {
	cd $HOME/.local/share/applications/Atom
}

function cdgap {
	cd $HOME/.local/share/applications/gVim
}

function cdvap {
	cd $HOME/.local/share/applications/VirtualBox
}

##########################
function cddd {
	cd $HOME/.local/share/desktop-directories
}

function cdi {
	cd $HOME/.local/share/icons
}
