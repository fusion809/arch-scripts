function jekex {
  cdfgi && bundle exec jekyll serve
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
  ps_mem ${$(pgrep $@ | tr '\n' ,)%,*}
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
