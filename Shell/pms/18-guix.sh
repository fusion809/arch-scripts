function guixup {
    BUILT=$(guix --version)
    BUILT=$(echo $BUILT | head -n 1 | cut -d ' ' -f 4)
    CURRENT=$(wget -cqO- https://git.savannah.gnu.org/git/guix.git/info/refs | grep "master" | sed 's|refs/heads/master||g')
    CURRENT=$(echo $CURRENT | head -n 1)

    if ! [[ $CURRENT == $BUILT ]]; then
         guix pull && guix package -u
    else
         "Guix is up-to-date!"
    fi
}

function guixupc {
    if hash guix 2>/dev/null; then
         guixup
    fi
}
