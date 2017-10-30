function guixup {
    guix pull && guix package -u
}

function guixupc {
    if hash guix 2>/dev/null; then
         guixup
    fi
}
