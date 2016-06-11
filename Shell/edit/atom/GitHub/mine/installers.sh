#!/bin/bash

function edgin {
  atom $INS/$1-installer
}

alias edatin=`edgin atom`
alias edbin=`edgin brackets`
alias edkin=`edgin komodo`
alias edltin=`edgin lighttable`
alias edvsin=`edgin vscode`
alias edvsi=edvsin

function edglin {
  LIST=$(for i in "$@"; do $INS/$i-installer \; done)
  atom $LIST
}

function edin {
	edglin atom brackets komodo lighttable vscode
}
