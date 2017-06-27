# Update vim local repo

function cpv {
     cp $HOME/.vimrc $ED/vim
     cp $HOME/.vim/syntax/sh.vim $ED/vim
     cp $HOME/.vim/spell/en.utf-8.add $ED/vim
}

function shvup {
     cpv && cdvim && push "$1" && cd -
}

