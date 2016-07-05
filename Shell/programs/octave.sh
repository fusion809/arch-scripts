function octcli {
	octave --no-gui
}

function octe {
	octave --eval $@
}

function ctof {
	octe "32+1.8*$1"
}
