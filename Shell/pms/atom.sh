function apmi {
	apm install $@
}

function apmrm {
	apm remove $@
}

alias apmr=apmrm

function apmu {
	apm update --noconfirm
}

alias apmup=apmu
