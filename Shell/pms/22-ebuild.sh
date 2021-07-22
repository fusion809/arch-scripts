function manif {
    sudo ebuild *.ebuild manifest
}

function ovimup {
    cdobsh $1
    pkgver=$(wget -q https://github.com/vim/vim/releases -O - | grep "tar\.gz" | head -n 1 | cut -d '/' -f 7 | cut -d '"' -f 1 | sed 's/v//g' | sed 's/\.tar\.gz//g')
    baseversion=$(echo $pkgver | sed 's/\.[0-9]*$//g')
    patchversion=$(echo $pkgver | sed "s/$baseversion//g" | sed 's/\.//g')
    vim_baseversion=$(cat vim.spec | grep "%define.*baseversion" | sed 's/%define.*baseversion\s*//g' | head -n 1)
    vim_patchversion=$(cat vim.spec | grep "%define.*patchlevel" | sed 's/%define.*patchlevel\s*//g' | head -n 1)

    if [[ $baseversion != $vim_baseversion ]]; then

         sed -i -e "s|baseversion $vim_baseversion|baseversion $baseversion|g" vim.spec
         sed -i -e "s|$vim_baseversion|$baseversion|g" $HOME/OBS/home:fusion809/gvim-gtk2/PKGBUILD
         sed -i -e 's|Release:       [0-9].*|Release:       1|g' vim.spec

         if [[ "$1" == "vim" ]]; then

              sed -i -e "s|$vim_baseversion|$baseversion|g" $HOME/AUR/gvim-gtk2/PKGBUILD
              sed -i -e "s|$vim_baseversion|$baseversion|g" $PK/PKGBUILDs/gvim-{gtk2,gtk3}/PKGBUILD

         fi

    fi

    if [[ $patchversion != $vim_patchversion ]]; then
         sed -i -e "s|patchlevel $vim_patchversion|patchlevel $patchversion|g" vim.spec

         if [[ -f PKGBUILD ]]; then
              sed -i -e "s|$vim_patchversion|$patchversion|g" PKGBUILD
         fi

         sed -i -e 's|Release:       [0-9].*|Release:       1|g' vim.spec

         if [[ "$1" == "vim" ]]; then

              sed -i -e "s|$vim_patchversion|$patchversion|g" {$HOME/OBS/home:fusion809/gvim-gtk2,$HOME/AUR/gvim-gtk2,$PK/PKGBUILDs/gvim-gtk2,$PK/PKGBUILDs/gvim-gtk3}/PKGBUILD

              sed -i -e "s|$vim_baseversion.$vim_patchversion|$pkgver|g" $HOME/OBS/home:fusion809/vim-debian/{debian.dsc,_service}

              time=$(date +"%a, %d %b %Y %H:%M:%S")
              sed -i "1s/^/vim (2:$pkgver-1) trusty; urgency=medium\n\n  * New upstream release\n\n -- Brenton Horne <brentonhorne77@gmail.com>  $time +1000\n\n/" $HOME/OBS/home:fusion809/vim-debian/debian.changelog

              cd $HOME/AUR/gvim-gtk2
              push "Bumping to $pkgver"
              cd -

              cd $PK/PKGBUILDs/gvim-gtk2
              push "Bumping to $pkgver"
              cd -

              cd $PK/PKGBUILDs/gvim-gtk3
              push "Bumping to $pkgver"
              cd -

              cd $PK/PKGBUILDs
              push "Bumping gvim submodules to $pkgver"
              cd -

              cd $HOME/OBS/home:fusion809/gvim-gtk2
              osc ci -m "Bumping to $pkgver"
              cd -

              cd $HOME/OBS/home:fusion809/vim-debian
              osc ci -m "Bumping to $pkgver"
              cd -

              vimaup
         fi
    fi

    if [[ $baseversion != $vim_baseversion ]] || [[ $patchversion != $vim_patchversion ]]; then
         osc ci -m "Bumping version to $pkgver"
    fi
}

function vimupb {
    # Determine latest Vim version by reading Vim releases page on GitHub
    pkgver=$(wget -q https://github.com/vim/vim/releases -O - | grep "tar\.gz" | head -n 1 | cut -d '/' -f 7 | cut -d '"' -f 1 | sed 's/v//g' | sed 's/\.tar\.gz//g')

    ############################################################
    ##################### app-editors/vim ######################
    ############################################################

    # Move to app-editors/vim dir
    pushd $PK/fusion809-overlay/app-editors/vim

    # Determine latest ebuild for Vim's pkgver 
    lver_vim=$(ls | grep ebuild | sort -u | tail -n 2 | head -n 1 | cut -d '-' -f 2 | sed 's/\.ebuild//g')

    # Check if latest ebuild ver and latest Vim ver match
    if ! [[ $lver_vim == $pkgver ]]; then
        # Bump the ebuild if they do not match
        # Wildcard is required as otherwise -r1, -r2, -r3, etc. will be ignored as suffixes.
        mv vim-$lver_vim*.ebuild vim-$pkgver.ebuild
        # Update manifests and merge package
        sudo repoman manifest
    fi

    # Pop out of app-editors/vim dir
    popd

    ############################################################
    ################### app-editors/vim-core ###################
    ############################################################
    # Change into app-editors/vim-core dir
    pushd $PK/fusion809-overlay/app-editors/vim-core

    # Get version of the newest ebuild in app-editors/vim-core
    lver_vimc=$(ls | grep ebuild | sort -u | tail -n 2 | head -n 1 | cut -d '-' -f 3 | sed 's/\.ebuild//g')

    # Check if pkgver and lver_vimc match
    if ! [[ $lver_vimc == $pkgver ]]; then
        # bump the ebuild if it they do not match
        mv vim-core-$lver_vimc*.ebuild vim-core-$pkgver.ebuild
        # Update manifests and merge package
        sudo repoman manifest
    fi

    # Pop back out
    popd

    ############################################################
    ##################### app-editors/gvim #####################
    ############################################################
    # Change into app-editors/gvim
    pushd $PK/fusion809-overlay/app-editors/gvim

    # Determine version of latest ebuild
    lver_gvim=$(ls | grep ebuild | sort -u | tail -n 2 | head -n 1 | cut -d '-' -f 2 | sed 's/\.ebuild//g')

    # Check if version matches pkgver
    if ! [[ $lver_gvim == $pkgver ]]; then
        # Bump ebuild to pkgver if they do not match
        mv gvim-$lver_gvim*.ebuild gvim-$pkgver.ebuild
        # Update manifests and merge package
        sudo repoman manifest
    fi

    # Commit to repo
    push "Bumping version to $pkgver"

    # Pop out
    popd
}

# Update Vim in OBS, fusion809-overlay and GVim.AppImage repo to latest
function vimup {
#    vimupb

    printf '\e[1;34m%-0s\e[m' "Running ovimup vim."
    printf "\n"
    ovimup vim

    printf '\e[1;34m%-0s\e[m' "Running ovimup vim-suse."
    printf "\n"
    ovimup "vim-suse"

    printf '\e[1;34m%-0s\e[m' "Running ovimup vim-redhat."
    printf "\n"
    ovimup "vim-redhat"
}

# Update Brave web browser in fusion809-overlay to latest version
function bravup {
    cdfo www-client/brave-bin
    PBRAVE_VER=$(ls | grep ebuild | cut -d '-' -f 3 | sed 's/\.ebuild//g')
    CBRAVE_VER=$(wget -q https://github.com/brave/browser-laptop/releases -O - | grep "tar\.gz" | head -n 1 | cut -d '/' -f 7 | cut -d '"' -f 1 | sed 's/[a-z]//g' | sed 's/\.*$//g' | sed 's/\.tar\.gz//g')
    BRAVE_TAR=$(wget -q https://github.com/brave/browser-laptop/releases -O - | grep "$CBRAVE_VER" | grep "Brave.tar.bz2")

    if ! [[ $PBRAVE_VER == $CBRAVE_VER ]] && `echo $BRAVE_TAR > /dev/null 2>&1`; then
         mv brave-bin-${PBRAVE_VER}.ebuild brave-bin-${CBRAVE_VER}.ebuild
         sudo rm -rf Manifest
         sudo repoman manifest
         push "[www-client/brave-bin] Bumping to ${CBRAVE_VER}"
    else
         printf "Either the latest version hasn't had Brave.tar.bz2 tagged to it or the latest version is already in the $FO repo.\n"
    fi
}

