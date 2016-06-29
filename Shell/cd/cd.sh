function cdh {
	cd $HOME/$1
}

# Non-hidden
function cdabs {
	cdh "abs/$1"
}

function cdaps {
	cdh "Arch_Packages"
}

function cdaa {
	cdh "atom/atom"
}

function cdbd {
	cdh "BIOVIA/DiscoveryStudio2016"
}

function cdch {
	cdh "chroot"
}

# - Desktop
function cdd {
	cdh "Desktop"
}

# - Downloads
function cddo {
	cdh "Downloads/$1"
}

# - Music
function cdm {
	cdh "Music/$1"
}

function cdpi {
	cd $PS/$1
}

function cdps {
	cdpi "Screenshots/$1"
}

# - Shell
function cdsh {
	cd $SHL/$1
}

function cdt {
	cd $HOME/Textbooks/$1
}

function cdvid {
	cd $VI/$1
}

function cdvl {
	cdvid "Lectures/$1"
}

function cdvy {
	cdvid "YouTube/$1"
}
