function jmol_update_quiet {
    if command -v curl > /dev/null 2>&1; then
        MAJOR=$(curl -sL https://sourceforge.net/projects/jmol/files/Jmol/ | tr , '\n' | grep 'span class="name"' | head -n 1 | cut -d '>' -f 2 | sed 's|</span||g' | cut -d ' ' -f 2)
        pkgver=$(wget -cqO- "https://sourceforge.net/projects/jmol/files/Jmol/Version%20${MAJOR}" | grep "Jmol%20${MAJOR}" | head -n 1 | cut -d '/' -f 7 | sed 's/Jmol%20//g')
    elif command -v wget > /dev/null 2>&1; then
        MAJOR=$(wget -cqO- https://sourceforge.net/projects/jmol/files/Jmol/ | tr , '\n' | grep 'span class="name"' | head -n 1 | cut -d '>' -f 2 | sed 's|</span||g' | cut -d ' ' -f 2) 
        pkgver=$(wget -cqO- "https://sourceforge.net/projects/jmol/files/Jmol/Version%20${MAJOR}" | grep "Jmol%20${MAJOR}" | head -  n 1 | cut -d '/' -f 7 | sed 's/Jmol%20//g')
    else
        printf "Neither cURL nor wget have been detected, please install them or, if already installed, add them to the system PATH.\n"
    fi

    pushd -q /home/fusion809/OBS/home:fusion809/jmol
    pkgsp=$(cat jmol.spec | grep "Version:" | cut -d ':' -f 2 | sed 's/\s*//g')

    if ! [[ $pkgver == $pkgsp ]]; then
        jmolup
    fi
    popd -q
}

alias jmolupq=jmol_update_quiet