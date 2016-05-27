#!/bin/bash

function edatin {
	atom $GHUBM/installer/atom-installer
}

function edbin {
  atom $GHUBM/installer/brackets-installer
}

function edkmin {
	atom $GHUBM/installer/komodo-installer
}

function edltin {
  atom $GHUBM/installer/lighttable-installer
}

function edvsin {
  atom $GHUBM/installer/vscode-installer
}

alias edvsi=edvsin

function edin {
	atom "$GHUBM/installer/atom-installer" "$GHUBM/installer/brackets-installer" "$GHUBM/installer/komodo-installer" "$GHUBM/installer/lighttable-installer" "$GHUBM/installer/vscode-installer"
}
