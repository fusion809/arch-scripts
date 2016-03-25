function apmi {
	apm install $@
}

function apmrm {
	apm remove $@
}

alias apmr=apmrm

function apmu {
	apm update --no-confirm
}

alias apmup=apmu
