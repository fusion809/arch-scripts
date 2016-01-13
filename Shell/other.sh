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
