# $GHUBM/packaging/PKGBUILDs repo
function cdpk {
	cd $PKG/$1
}

function cdate {
	cdpk atom-editor
}

function cdatpb {
	cdpk atom-editor-beta
}

function cdgg {
  cdpk gvim-git
}

function cdvs {
	cdpk visual-studio-code-oss
}

function cdvsg {
	cdpk visual-studio-code-git
}

function cdpc {
	cdpk pkgbuild-current
}
