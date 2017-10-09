## Update local arch-scripts repo
function cps {
    sudo chmod +x -R {$HOME,/root}/Shell/
    rm -rf $ARS/Shell && mkdir $ARS/Shell
    sudo rm -rf $ARS/root/Shell
    cp -a $HOME/Shell/* $ARS/Shell
    cp -a $HOME/{.bashrc,.zshrc} $ARS/
    sudo cp -a /root/{Shell,.bashrc,.zshrc} $ARS/root/
}

function cdas {
    cd $ARS
}

## Update arch-scripts GitHub repo
function shup {
    cps && cdas && push "$1" && cd - && szsh
}

## Update LFS repo
function cplfs {
    sudo chmod +x -R $LFS/{$HOME,/root}/Shell/
    rm -rf $LFSS/Shell && mkdir $LFSS/Shell
    sudo rm -rf $LFSS/root/Shell
    cp -a $LFS/$HOME/Shell/* $LFSS/Shell
    cp -a $LFS/$HOME/{.zshrc} $LFSS/
    sudo cp -a $LFS/root/{Shell,.bashrc,.zshrc} $LFSS/root
}

function cdlfs {
    cd $LFSS/$1
}

function lfsup {
    cplfs && cdlfs && push "$1" && cd -
}

function sudoers {
    sudo cp -a $GHUBM/scripts/arch-scripts/etc/sudoers /etc/sudoers
}

## Update bin repo
function bup {
    cd $HOME/bin
    if [[ -n "$1" ]]; then
         push "$1"
    else
         push "Updating"
    fi
    cd -
}

function shupat {
    cd $HOME/.atom
    pushat "Updating"
    cd -
}
