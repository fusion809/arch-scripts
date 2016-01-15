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
    ps_mem ${$(pgrep $1 | tr '\n' ,)%,*},$2 > "$1-manjaro-psmem.sh" && gist "$1-manjaro-psmem.sh" && rm "$1-manjaro-psmem.sh"
  elif [[ -n $1 ]]; then
    ps_apl "$1" > "$1-manjaro-psmem.sh" && gist "$1-manjaro-psmem.sh" && rm "$1-manjaro-psmem.sh"
  fi
}

function ps_gistv {
  # A is the name of a program
  # B is the name of a program
  # I is the process ID of a program
  K=$(pgrep $A | tr '\n' ,) && K=${K%,*}
  L=$(pgrep $B | tr '\n' ,) && L=${L%,*}
  M=$(pgrep $C | tr '\n' ,) && M=${M%,*}
  N=$(pgrep $D | tr '\n' ,) && N=${N%,*}

  if [[ -n "$DESC" ]]; then
    if [[ -n "$N" ]] && [[ -n "$I" ]]; then
      Q=$(sudo ps_mem -p "$K","$L","$M","$N","$I")
      echo "$Q" > "$DESC-manjaro-psmem.sh" && gist "$DESC-manjaro-psmem.sh" && rm "$DESC-manjaro-psmem.sh"
    elif [[ -n "$N" ]]; then
      Q=$(sudo ps_mem -p "$K","$L","$M","$N")
      echo "$Q" > "$DESC-manjaro-psmem.sh" && gist "$DESC-manjaro-psmem.sh" && rm "$DESC-manjaro-psmem.sh"
    elif [[ -n "$M" ]] && [[ -n "$I" ]]; then
      Q=$(sudo ps_mem -p "$K","$L","$M","$I")
      echo "$Q" > "$DESC-manjaro-psmem.sh" && gist "$DESC-manjaro-psmem.sh" && rm "$DESC-manjaro-psmem.sh"
    elif [[ -n "$M" ]]; then
      Q=$(sudo ps_mem -p "$K","$L","$M")
      echo "$Q" > "$DESC-manjaro-psmem.sh" && gist "$DESC-manjaro-psmem.sh" && rm "$DESC-manjaro-psmem.sh"
    elif [[ -n "$L" ]] && [[ -n "$I" ]]; then
      Q=$(sudo ps_mem -p "$K","$L","$I")
      echo "$Q" > "$DESC-manjaro-psmem.sh" && gist "$DESC-manjaro-psmem.sh" && rm "$DESC-manjaro-psmem.sh"
    elif [[ -n $I ]]; then
      Q=$(sudo ps_mem -p "$K","$I")
      echo "$Q" > "$DESC-manjaro-psmem.sh" && gist "$DESC-manjaro-psmem.sh" && rm "$DESC-manjaro-psmem.sh"
    else
      Q=$(sudo ps_mem -p "$K")
      echo "$Q" > "$DESC-manjaro-psmem.sh" && gist "$DESC-manjaro-psmem.sh" && rm "$DESC-manjaro-psmem.sh"
    fi
  fi
}

function ps_gistid {
  ps_mem $@ >> manjaro-psmem.sh
}
