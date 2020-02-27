function rofi_update_quiet {
    # Rofi latest version available
    if command -v curl > /dev/null 2>&1; then
        orlv=$(curl -sL https://github.com/DaveDavenport/rofi/releases | grep "[a-z]*-.*\.tar\.gz" | head -n 1 | cut -d "/" -f 6)
    elif command -v wget > /dev/null 2>&1; then
        orlv=$(wget -cqO- https://github.com/DaveDavenport/rofi/releases | grep "[a-z]*-.*\.tar\.gz" | head -n 1 | cut -d "/" -f 6)
    else
        printf "Neither cURL nor wget are detected, please install them, or if installed add to system PATH.\n" && return 
    fi
    # Rofi latest packaged version
    orpv=$(cat /home/fusion809/OBS/home:fusion809/rofi/rofi.spec | grep "Version:" | sed 's/Version:\s*//g')

    if ! [[ $orpv == $orlv ]]; then
        rofiup
    fi
}

alias rofiupq=rofi_update_quiet