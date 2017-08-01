function pbuild {
    packer-io build -only=virtualbox-iso $@
}

function pk {
    for i in "$@"
    do
         sudo kill -9 $i
    done
}

function jist {
    $1 >> $2-arch-psmem.sh && gist $2-arch-psmem.sh && rm $2-arch-psmem.sh
}
