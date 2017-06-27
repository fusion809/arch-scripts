function cdweb {
    cd $WEB/$1
}

function cdim {
    cdweb "images/$1"
}

function cdman {
    cdweb "man/$1"
}
