function update {
    # yay
    if command -v yay &>/dev/null ; then
	    yayup
    fi

    # Nix
    if command -v nix-env &> /dev/null ; then
    	nixupc
    fi

    # Guix
    if command -v guix &> /dev/null ; then
    	guixupc
    fi

    # APM
    if command -v apm &> /dev/null ; then
    	apmup
    fi

    # Updating GitHub repos
    if ( command -v git &> /dev/null ) && [[ -d $GHUBO/OpenRA ]]; then
    	gitoup
    fi
 
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

    if command -v flatpak &> /dev/null; then
         flatpak update
    fi

    # GRUB
    update-grub
}
