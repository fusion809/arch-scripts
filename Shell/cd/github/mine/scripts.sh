# Arch setup repo
function cdast {
	cd $SCR/arch-setup
}

# My arch-scripts repo
function cdarch {
	cd $SCR/arch-scripts/$1
}

# My gentoo-scripts repo
function cdgs {
	cd $SCR/gentoo-scripts/$1
}

# - GNU_Octave
function cdoct {
	cd $SCR/GNU_Octave
}

# My JavaScripts
function cdjs {
	cd $SCR/JScripts
}

# My Python scripts repo
function cdpy {
	cd $SCR/python-scripts
}

# Change into $SCR
function cdsc {
	cd $SCR/$1
}

# Lua scripts
function cdlu {
	cdsc "lua-scripts/$1"
}

# Void sripts
function cdvsc {
    cdsc "void-scripts/$1"
}
