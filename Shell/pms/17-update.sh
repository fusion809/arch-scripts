function update {
    if ! `hash pacaur 2>/dev/null`; then
         cda cower
         makepkg -sifC --noconfirm
         cda pacaur
         makepkg -sifC --noconfirm
    fi

    pacaup

    if hash nix-env 2>/dev/null; then
         sudo nix-channel --update && sudo nix-env --upgrade
    fi

    if hash apm 2>/dev/null; then
         apmup
    fi
}

