# atom
function edat {
	if [[ "$1" == "config" ]]; then
		atom $AT/config.cson
	elif [[ "$1" == "packages" ]] || [[ $1 == "pkglist" ]]; then
		atom $AT/packages.cson
	elif [[ "$1" == "keymap" ]]; then
		atom $AT/keymap.cson
	elif [[ "$1" == "styles" ]]; then
		atom $AT/styles.less
	else
		atom $AT/$1
	fi
}
