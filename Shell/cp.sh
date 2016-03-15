function cpobs {
	cd ~/OBS/home:fusion809:arch_extra
	for i in "$@"
	do
		pbget --aur $i
		cp -a package-query/_service $i
    osc add $i
    cd $i
  	osc ci -m "Initial commit"
		cd ..
	done
}
