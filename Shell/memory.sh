function ps_ap {
  ps_mem $(ps_find $@)
}

function ps_apl {
  if [[ -n $3 ]]; then
    ps_mem ${$(pgrep $1 | tr '\n' ,)%,*},${$(pgrep $2 | tr '\n' ,)%,*},${$(pgrep $3 | tr '\n' ,)%,*}
  elif [[ -n $2 ]]; then
    ps_mem ${$(pgrep $1 | tr '\n' ,)%,*},${$(pgrep $2 | tr '\n' ,)%,*}
  else
    ps_mem ${$(pgrep $1 | tr '\n' ,)%,*}
  fi
}

function ps_pm {
  if [[ -n $5 ]]; then
    ps_mem ${$(pgrep $1 | tr '\n' ,)%,*},$2,$3,$4,$5
  elif [[ -n $4 ]]; then
    ps_mem ${$(pgrep $1 | tr '\n' ,)%,*},$2,$3,$4
  elif [[ -n $3 ]]; then
    ps_mem ${$(pgrep $1 | tr '\n' ,)%,*},$2,$3
  elif [[ -n $2 ]]; then
    ps_mem ${$(pgrep $1 | tr '\n' ,)%,*},$2
  else
    ps_mem ${$(pgrep $1 | tr '\n' ,)%,*}
  fi
}

function ps_find {
  pidof $@ | tr '\ ' ','
}

function ps_gax {
  ps ax | grep $@
}

function ps_gist {
  if [[ -n $2 ]]; then
    ps_mem ${$(pgrep $1 | tr '\n' ,)%,*},$2 > "$1-sabayon-psmem.sh" && gist "$1-sabayon-psmem.sh" && rm "$1-sabayon-psmem.sh"
  elif [[ -n $1 ]]; then
    ps_apl "$1" > "$1-sabayon-psmem.sh" && gist "$1-sabayon-psmem.sh" && rm "$1-sabayon-psmem.sh"
  fi
}

function ps_mem {
  sudo python $HOME/GitHub/ps_mem/ps_mem.py -p $@
}
