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

function edblog {
	atom ~/GitHub/fusion809.github.io
}

function edsh {
	atom ~/Shell
}

function edpk {
	atom ~/GitHub/PKGBUILDs
}
