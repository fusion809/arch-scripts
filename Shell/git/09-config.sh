function cpi3 {
    rm -rf $GHUBM/config/i3-configs/.i3
    cp $HOME/.xsession $GHUBM/config/i3-configs
    cp -a $HOME/.i3 $GHUBM/config/i3-configs
    sudo cp /usr/local/bin/optirun-0ad $GHUBM/config/i3-configs/usr/local/bin
    sudo cp /usr/local/bin/rs-launcher $GHUBM/config/i3-configs/usr/local/bin
    sudo cp /usr/local/bin/scrnshot $GHUBM/config/i3-configs/usr/local/bin
}

function i3up {
    cpi3 && cdci3 && push "$1" && cd -
}

