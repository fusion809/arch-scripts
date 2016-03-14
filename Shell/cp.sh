function cpobs {
	if ! [[ -n $2 ]]; then
		cp -r /var/abs/community/$1 ~/OBS/home:fusion809
	else
		cp -r /var/abs/$2/$1 ~/OBS/home:fusion809
	fi
}
