function i3up {
    cdci3 && git checkout archlinux && push "$1" && cd -
}

function swup {
    cdcsw && git checkout archlinux && push "$1" && cd -
}
