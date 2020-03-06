for i in $HOME/Shell/updater/*.sh
do
    . "$i"
done

function update_all_quiet {
    avolupq
    avoupq
    jmolupq
    jupupq
    msymupq
    noteupq
    openrabupq
    ra2upq
    caupq
    racupq
    d2upq
    dot5upq
    drupq
    genupq
    kkndupq
    mwupq
    raplusupq
    rvupq
    spupq
    ssupq
    uraupq
    vsupq
    yrupq
    rofiupq
    spglibupq
    vimupq
    zshupq
}

function update_all_quiet_loop {
    while :
    do
        printf "%s\n" "Running update_all_quiet at $(date +"%r %A, %d %B %Y")"
        update_all_quiet
        if [[ -n "$@" ]]; then
            sleep "$@"
        else
            sleep 10m
        fi
    done
}