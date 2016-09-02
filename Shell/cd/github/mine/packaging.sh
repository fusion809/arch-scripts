function cdpck {
	cd $PK/$1
}

alias cdpack=cdpck

function cdgaa {
	cdpck arch-atom/$1
}

alias cdpaa=cdgaa

# my atom-editor repo
function cdae {
	cdpck atom-text-editor/$1
}

function cdapi {
	cdpck AppImages/$1
}
