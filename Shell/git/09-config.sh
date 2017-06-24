function cpi3 {
    rm -rf $CFG/i3-configs/.i3
    cp $HOME/.Xresources $CFG/i3-configs
    cp $HOME/.xsession $CFG/i3-configs
    cp $HOME/.i3status.conf $CFG/i3-configs
    cp -a $HOME/.i3 $CFG/i3-configs
    sudo cp /usr/local/bin/optirun-0ad $CFG/i3-configs/usr/local/bin
    sudo cp /usr/local/bin/rs-launcher $CFG/i3-configs/usr/local/bin
    sudo cp /usr/local/bin/scrnshot $CFG/i3-configs/usr/local/bin
}

function i3up {
    cpi3 && cdci3 && push "$1" && cd -
}

