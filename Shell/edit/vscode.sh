#!/bin/bash

###########################################################
# define vscode command
if which visual-studio-code >/dev/null 2>&1; then
  alias vscode=visual-studio-code
elif which visual-studio-code-oss >/dev/null 2>&1; then
  alias vscode=visual-studio-code-oss
fi

export vscode
###########################################################

function vsai {
  vscode $GHUBM/archiso
}

function vsatin {
  vscode $GHUBM/atom-installer
}

function vsau {
  vscode $HOME/AUR
}

function vsds {
  vscode $HOME/DiscoveryStudio
}

function vsjs {
  vscode $HOME/JScripts
}

function vspk {
  vscode $PKG
}

function vspy {
  vscode $GHUBM/python-scripts
}

function vssh {
  vscode $SHL
}
