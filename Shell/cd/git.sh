# git-controlled repos not in $HOME/GitHub
function cda {
        if ! [[ -d $HOME/AUR/$1 ]]; then
		cd $HOME/AUR
		gitaur $1
                cd -
        fi
	cd $HOME/AUR/$1
}

function cdbin {
	cd $HOME/bin
}

function cdds {
	cd $HOME/"DiscoveryStudio"
}

function cdsn {
  cd $HOME/snapcraft/$1
}
