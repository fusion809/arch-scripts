# Change into $SCR
function cdsc {
	cd $SCR/$1
}

# Arch setup repo
function cdast {
    cdsc "arch-setup/$1"
}

# My arch-scripts repo
function cdarch {
    cdsc "arch-scripts/$1"
}

# fedora-scripts repo
function cdfs {
    cdsc "fedora-scripts/$1"
}

# My gentoo-scripts repo
function cdgs {
    cdsc "gentoo-scripts/$1"
}

# - GNU_Octave
function cdoct {
    cdsc "GNU_Octave/$1"
}

# My JavaScripts
function cdjs {
    cdsc "JScripts/$1"
}

# openSUSE scripts
function cdos {
    cdsc "opensuse-scripts/$1"
}

# My Python scripts repo
function cdpy {
    cdsc "python-scripts/$1"
}

# Lua scripts
function cdlu {
    cdsc "lua-scripts/$1"
}

# Void sripts
function cdvsc {
    cdsc "void-scripts/$1"
}
