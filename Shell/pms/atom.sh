function apmi {
	apm install $@
}

function apmrm {
	apm remove $@
}

alias apmr=apmrm

function apmu {
	apm update
}

alias apmup=apmu
