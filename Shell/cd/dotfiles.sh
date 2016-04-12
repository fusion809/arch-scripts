# file system structure
# ~/
# - .atom
function cdat {
	echo "Use pushat for this repo"
	cd ~/.atom
}

# - .config/menus
function cdmen {
	cd ~/.config/menus/
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
	cd ~/.local/share/applications
}

function cdapa {
	cd ~/.local/share/applications/Atom
}

function cdgap {
	cd ~/.local/share/applications/gVim
}

function cdvap {
	cd ~/.local/share/applications/VirtualBox
}

##########################
function cddd {
	cd ~/.local/share/desktop-directories
}

function cdi {
	cd ~/.local/share/icons
}
