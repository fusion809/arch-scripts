export BASE_URL="https://raw.githubusercontent.com/fusion809"

function trigger {
     bash <(curl -s $BASE_URL/AppImages/master/trigger.sh) "$1"
}

function vimaup {
     printf '\e[1;34m%-0s\e[m' "Running vimaup."
     printf "\n"
     bash <(curl -s $BASE_URL/GVim.AppImage/master/trigger.sh)
}

function codeup {
     bash <(curl -s $BASE_URL/Code-OSS.AppImage/master/trigger.sh)
}

function emacsup {
     bash <(curl -s $BASE_URL/Emacs.AppImage/master/trigger.sh)
}

