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
    if hash nix-env 2>/dev/null; then
         sudo nix-channel --update && sudo nix-env --upgrade
    fi

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
    cd $HOME/.cache/pacaur/firefox-nightly
         fntime=$(ls | grep "bz2$" | cut -d '-' -f 1)
         actime=$(date +%Y%m%d)

         if ! [[ $fntime == $actime ]]; then
              makepkg -sifC --noconfirm
         fi
    cd -
}
