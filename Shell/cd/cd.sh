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
	cdh "Chem/$1"
}

# - Desktop
function cdd {
	cdh "Desktop"
}

# - Documents
function cddc {
	cdh "Documents/$1"
}

# - Downloads
function cddo {
	cdh "Downloads/$1"
}

function cdgol {
	cdh "go/$1"
}

function cdja {
	cdh "Journal articles/$1"
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

function cdvs {
	cdvid "SO/$1"
}

function cdcfe {
	cddc CodeLite/CPP-Math-Projects/$1
}

alias cdcpp=cdcfe

function compfe {
	/usr/bin/g++ -Wall -fPIC -o "$HOME/Documents/CodeLite/firstExample/example" "$HOME/Documents/CodeLite/firstExample/example.cpp" -I/usr/include/qt -I/usr/include/qt/QtCore -I/usr/include/qt/QtGui -I/usr/include/qt/QtWidgets
}
