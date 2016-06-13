#!/bin/bash

function edgin {
  atom $2 $INS/$1-installer
}

function edatin {
  edgin atom $1
}

function edbin {
  edgin brackets $1
}

function edkin {
  edgin komodo $1
}

function edltin {
  edgin lighttable $1
}

function edvsin {
  edgin vscode $1
}

alias edvsi=edvsin

function edglin {
  unset LIST
  unset OPT
  for i in "$@"
  do
    if [[ "$i" == *"--dev"* ]]; then
      OPT="--dev"
    elif [[ "$i" == *"--safe"* ]]; then
      OPT="--safe"
    fi
    LIST+=("$INS/$i-installer")
  done

  atom "$OPT" $LIST
}

function edin {
	edglin atom brackets komodo lighttable vscode
}
