function update {
    # pacaur
    if ! `hash pacaur 2>/dev/null`; then
         cda cower
         makepkg -sifC --noconfirm
         cda pacaur
         makepkg -sifC --noconfirm
    fi

    pacaup

    # Nix
    nixupc

    # APM
    if hash apm 2>/dev/null; then
         apmup
    fi

    # Updating GitHub repos
    for i in $GHUBO/*
    do
         cd $i
         git pull --all -q
         cd -
    done

    # GRUB
    update-grub
}
