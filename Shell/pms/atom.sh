# Install package(s)
function apmi {
	apm install "$@" --no-confirm || (printf "Package installation failed" && exit)
}

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

function apmbup {
	apm-bleeding update --no-confirm "$@"
}

alias apmbu=apmbup

function apmbin {
	apm-bleeding install "$@" --no-confirm
}

function apmbrm {
	apm-bleeding remove "$@" --no-confirm
}
