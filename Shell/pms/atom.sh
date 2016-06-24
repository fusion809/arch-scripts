# Install package
function apmi {
	apm install $@
}

# Remove package
function apmrm {
	apm remove $@
}

alias apmr=apmrm

# Search packages
function apms {
	apm search $@
}

# Update packages
function apmu {
	apm update --no-confirm
}

alias apmup=apmu
