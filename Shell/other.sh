function jekex {
  cdfgi && bundle exec jekyll serve
}

function wgetg {
	wget -c https://gist.github.com/$1
}

function wgetjs {
  cd $HOME/GitHub/fusion809.github.io/js
	for i in "$@"
	do
		wget -c https://gist.github.com/$i.js
	done
}

function ps_mem {
  sudo python $HOME/GitHub/ps_mem/ps_mem.py -p $@
}

function ps_gax {
  ps ax | grep $@
}

function ps_find {
  pidof $@ | tr '\ ' ','
}

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

function ps_gist {
  ps_apl "$1" > "$1-sabayon-psmem.sh" && gist "$1-sabayon-psmem.sh" && rm "$1-sabayon-psmem.sh"
}

function octcli {
	octave --no-gui
}

function pbuild {
	packer-io build -only=virtualbox-iso $@
}

function pk {
  for i in "$@"
  do
    sudo kill -9 $i
  done
}
