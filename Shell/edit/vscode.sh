#!/bin/bash

###########################################################
# define vscode command
alias vscode=code-oss

###########################################################

function vsai {
  vscode $GHUBM/archiso/$1
}

function vsatin {
  vscode $INS/atom-installer/$1
}

function vsau {
  vscode $HOME/AUR/$1
}

function vsds {
  vscode $HOME/DiscoveryStudio/$1
}

function vsjs {
  vscode $JS/$1
}

function vspk {
  vscode $PKG/$1
}

function vspy {
  vscode $PY/$1
}

function vssh {
  vscode $SHL/$1
}

function vsfu {
  vscode $ATO/fusion-ui/$1
}
