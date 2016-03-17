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

function cpobsm {
	cd ~/OBS/home:fusion809:arch_extra_multilib
	for i in "$@"
	do
		pbget $i
		cp -a ../home:fusion809:arch_extra/package-query/_service $i
		osc add $i
		cd $i
		osc ci -m "Initial commit"
		cd ..
	done
}
