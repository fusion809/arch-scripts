function ps_ap {
  ps_mem $(ps_find $@)
}

function ps_apl {
  # A is the name of a program
  # B is the name of a program
  # I is the process ID of a program

  re='^[0-9]+$'
  if ! [[ -n "$A" ]]; then
    if [[ "$1" =~ "$re" ]]; then
      I="$1"
    else
      A="$1"
    fi
  fi

  if [[ -n $A ]]; then
  K=$(pgrep $A | tr '\n' ,) && K=${K%,*}
  fi
  if [[ -n $B ]]; then
    L=$(pgrep $B | tr '\n' ,) && L=${L%,*}
  fi
  if [[ -n $C ]]; then
    M=$(pgrep $C | tr '\n' ,) && M=${M%,*}
  fi
  if [[ -n $D ]]; then
    N=$(pgrep $D | tr '\n' ,) && N=${N%,*}
  fi

  if [[ -n "$N" ]] && [[ -n "$I" ]]; then
    Q=$(sudo ps_mem -p "$K","$L","$M","$N","$I")
  elif [[ -n "$N" ]]; then
    Q=$(sudo ps_mem -p "$K","$L","$M","$N")
  elif [[ -n "$M" ]] && [[ -n "$I" ]]; then
    Q=$(sudo ps_mem -p "$K","$L","$M","$I")
  elif [[ -n "$M" ]]; then
    Q=$(sudo ps_mem -p "$K","$L","$M")
  elif [[ -n "$L" ]] && [[ -n "$I" ]]; then
    Q=$(sudo ps_mem -p "$K","$L","$I")
  elif [[ -n "$L" ]]; then
    Q=$(sudo ps_mem -p "$K","$L")
  elif [[ -n $I ]] && [[ -n "$K" ]]; then
    Q=$(sudo ps_mem -p "$K","$I")
  elif [[ -n $I ]]; then
    Q=$(sudo ps_mem -p "$I")
  else
    Q=$(sudo ps_mem -p "$K")
  fi
  echo "$Q"
  unset Q
  unset A
  unset I
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
    ps_mem ${$(pgrep $1 | tr '\n' ,)%,*},$2 > "$1-arch-psmem.sh" && gist "$1-arch-psmem.sh" && rm "$1-arch-psmem.sh"
  elif [[ -n $1 ]]; then
    ps_apl "$1" > "$1-arch-psmem.sh" && gist "$1-arch-psmem.sh" && rm "$1-arch-psmem.sh"
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
    # A is the name of a program
    # B is the name of a program
    # I is the process ID of a program
    if ![[ -n "$A" ]]; then
      A="$1"
    fi

    K=$(pgrep $A | tr '\n' ,) && K=${K%,*}
    if [[ -n $B ]]; then
      L=$(pgrep $B | tr '\n' ,) && L=${L%,*}
    fi
    if [[ -n $C ]]; then
      M=$(pgrep $C | tr '\n' ,) && M=${M%,*}
    fi
    if [[ -n $D ]]; then
      N=$(pgrep $D | tr '\n' ,) && N=${N%,*}
    fi

    if [[ -n "$N" ]] && [[ -n "$I" ]]; then
      Q=$(sudo ps_mem -p "$K","$L","$M","$N","$I")
    elif [[ -n "$N" ]]; then
      Q=$(sudo ps_mem -p "$K","$L","$M","$N")
    elif [[ -n "$M" ]] && [[ -n "$I" ]]; then
      Q=$(sudo ps_mem -p "$K","$L","$M","$I")
    elif [[ -n "$M" ]]; then
      Q=$(sudo ps_mem -p "$K","$L","$M")
    elif [[ -n "$L" ]] && [[ -n "$I" ]]; then
      Q=$(sudo ps_mem -p "$K","$L","$I")
    elif [[ -n "$L" ]]; then
      Q=$(sudo ps_mem -p "$K","$L")
    elif [[ -n $I ]]; then
      Q=$(sudo ps_mem -p "$K","$I")
    else
      Q=$(sudo ps_mem -p "$K")
    fi
    echo "$Q" > "$DESC-arch-psmem.sh" && gist "$DESC-arch-psmem.sh" && rm "$DESC-arch-psmem.sh"
  fi
}

function ps_gistid {
  ps_mem $@ >> arch-psmem.sh
}
