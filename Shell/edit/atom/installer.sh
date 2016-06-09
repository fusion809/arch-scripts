#!/bin/bash

function edatin {
	atom $GHUBM/installers/atom-installer
}

function edbin {
  atom $GHUBM/installers/brackets-installer
}

function edkmin {
	atom $GHUBM/installers/komodo-installer
}

function edltin {
  atom $GHUBM/installers/lighttable-installer
}

function edvsin {
  atom $GHUBM/installers/vscode-installer
}

alias edvsi=edvsin

function edin {
	atom "$GHUBM/installers/atom-installer" "$GHUBM/installers/brackets-installer" "$GHUBM/installers/komodo-installer" "$GHUBM/installers/lighttable-installer" "$GHUBM/installers/vscode-installer"
}
