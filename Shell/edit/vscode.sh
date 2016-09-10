#!/bin/bash

###########################################################
# define vscode command
alias vscode=code-oss

###########################################################

function vsai {
  vscode $GHUBM/archiso
}

function vsatin {
  vscode $INS/atom-installer
}

function vsau {
  vscode $HOME/AUR/$1
}

function vsds {
  vscode $HOME/DiscoveryStudio
}

function vsjs {
  vscode $JS
}

function vspk {
  vscode $PKG/$1
}

function vspy {
  vscode $PY/$1
}

function vssh {
  vscode $SHL
}

function vsfu {
	vscode $ATO/fusion-ui
}
