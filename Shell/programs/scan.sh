function scan {
	scanimage --device=pixma:04A9176D --format=png > $HOME/Pictures/Scans/$1.png || scanimage --device=pixma:04A9176D_0E8F33 --format=png > $HOME/Pictures/Scans/$1.png || scanimage --device=pixma:04A9173D --format=png > $HOME/Pictures/Scans/$1.png
}

function invscna {
	scan Invoice$1
}
