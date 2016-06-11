#!/bin/bash

function edgin {
  atom $INS/$1-installer
}

function edatin {
  edgin atom
}

function edbin {
  edgin brackets
}

function edkin {
  edgin komodo
}

function edltin {
  edgin lighttable
}

function edvsin {
  edgin vscode
}

alias edvsi=edvsin

function edglin {
  unset LIST
  for i in "$@"
  do
    LIST+=("$INS/$i-installer")
  done
  atom $LIST
}

function edin {
	edglin atom brackets komodo lighttable vscode
}
