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
