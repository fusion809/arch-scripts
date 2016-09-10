#!/bin/bash

###########################################################
# define vscode command
if which code >/dev/null 2>&1; then
  alias vscode=code
elif which code-oss >/dev/null 2>&1; then
  alias vscode=code-oss
fi

export vscode
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
