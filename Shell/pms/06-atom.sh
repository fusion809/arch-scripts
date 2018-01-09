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
    if hash apm 2>/dev/null; then
         apm update --no-confirm "$@"
    fi
}

alias apmup=apmu

