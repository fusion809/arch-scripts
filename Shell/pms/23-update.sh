function update {
    # yay
    if command -v yay &>/dev/null ; then
	    yayup
    fi

    # APM
    if command -v apm &> /dev/null ; then
    	apmup
    fi


    if command -v flatpak &> /dev/null; then
         flatpak update
    fi

    # GRUB
    update-grub

    pacaup

    if command -v snap &> /dev/null ; then
	sudo snap refresh
    fi
}
