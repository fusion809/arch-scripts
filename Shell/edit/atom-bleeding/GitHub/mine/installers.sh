#!/bin/bash

function edginb {
  atom-bleeding $2 $INS/$1-installer
}

function edatinb {
  edgin atom-bleeding $1
}

function edbinb {
  edgin brackets $1
}

function edkinb {
  edgin komodo $1
}

function edltinb {
  edgin lighttable $1
}

function edvsinb {
  edgin vscode $1
}

alias edvsi=edvsin

function edglinb {
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

  atom-bleeding "$OPT" $LIST
}

function edinb {
	edglin atom-bleeding brackets komodo lighttable vscode
}
