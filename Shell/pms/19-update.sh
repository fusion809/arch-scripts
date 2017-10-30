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

    # Guix
    guixupc

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
    
    # Update firefox-nightly
    if [[ -d $HOME/.cache/pacaur/firefox-nightly ]]; then
         cd $HOME/.cache/pacaur/firefox-nightly
              fntime=$(ls | grep "bz2$" | cut -d '-' -f 1)
              actime=$(date +%Y%m%d)

              if ! [[ $fntime == $actime ]]; then
                   makepkg -sifC --noconfirm
              fi
         cd -
    fi

    if hash flatpak 2>/dev/null; then
         flatpak update
    fi

    # GRUB
    update-grub
}
