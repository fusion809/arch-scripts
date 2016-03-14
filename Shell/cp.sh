function cpobs {
	cdobs
	for i in "$@"
	do
		pbget --aur $i
		cp -a package-query/_service $i
                osc add $i
                cd $i
                osc ci -m "Initial commit"
	done
}
