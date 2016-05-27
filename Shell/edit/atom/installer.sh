#!/bin/bash

function edatin {
	atom $GHUBM/atom-installer
}

function edbin {
  atom $GHUBM/brackets-installer
}

function edkmin {
	atom $GHUBM/komodo-installer
}

function edltin {
  atom $GHUBM/lighttable-installer
}

function edvsin {
  atom $GHUBM/vscode-installer
}

alias edvsi=edvsin

function edin {
	atom "$GHUBM/atom-installer" "$GHUBM/brackets-installer" "$GHUBM/komodo-installer" "$GHUBM/lighttable-installer" "$GHUBM/vscode-installer"
}
