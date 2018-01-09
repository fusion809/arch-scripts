function gitoup {
    for i in $GHUBO/*
    do
         cd $i
         #git pull --all -q
         gitup
         cd -
    done
}
