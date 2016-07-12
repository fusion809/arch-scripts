# Install package(s)
function apmi {
	apm install "$@" --no-confirm || (printf "Package installation failed" && exit)
}

alias apmin=apmi

# List package(s)
function apml {
	apm list "$@"
}

# Remove package(s)
function apmrm {
	apm remove "$@" --no-confirm || (printf "Package removal failed" && exit)
}

alias apmr=apmrm

# Search package
function apms {
	apm search "$@"
}

# Update packages
function apmu {
	apm update --no-confirm "$@"
}

alias apmup=apmu

#--- Bleeding ---#
function apmbup {
	apm-bleeding update --no-confirm "$@"
}

alias apmbu=apmbup

function apmbi {
	apm-bleeding install "$@" --no-confirm
}

alias apmbin=apmbi

function apmbrm {
	apm-bleeding remove "$@" --no-confirm
}

alias apmbr=apmbrm

function apmbs {
	apm-bleeding search "$@"
}
