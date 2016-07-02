# atom-bleeding
function edatb {
	if [[ "$1" == "config" ]]; then
		atom-bleeding $AT/config.cson
	elif [[ "$1" == "packages" ]] || [[ $1 == "pkglist" ]]; then
		atom-bleeding $AT/packages.cson
	elif [[ "$1" == "keymap" ]]; then
		atom-bleeding $AT/keymap.cson
	elif [[ "$1" == "styles" ]]; then
		atom-bleeding $AT/styles.less
	else
		atom-bleeding $AT/$1
	fi
}
