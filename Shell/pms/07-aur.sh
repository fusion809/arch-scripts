function cppk {
    cp -a $PKG/${PWD##*/}/{PKGBUILD,*.install,*.patch,*.h} $HOME/AUR/${PWD##*/}
}

function cpau {
    cp -a $HOME/AUR/${PWD##*/}/{PKGBUILD,*.install} $PKG/${PWD##*/}/
}

function getaur {
    for i in "$@"
    do
         wget -cqO- https://aur.archlinux.org/cgit/aur.git/snapshot/$i.tar.gz | tar -xz
    done
}

function curlaur {
    for i in "$@"
    do
         curl https://aur.archlinux.org/cgit/aur.git/snapshot/$i.tar.gz | tar -xz
    done
}

# git tools
function gita {
	for i in "$@"
	do
		git clone https://aur.archlinux.org/$i.git /home/fusion809/AUR/$i
	done
}

function gitaur {
    for i in "$@"
    do
         git clone ssh://aur@aur.archlinux.org/$i.git $HOME/AUR/$i
    done
}

function pushaur {
    if [[ -n $1 ]]; then
         mksrcinfo
         git add PKGBUILD .SRCINFO *.install
         git commit -m "$1"
         git push origin master
    else
         mksrcinfo
         git add PKGBUILD .SRCINFO *.install
         git commit -m 'Initial import'
         git push origin master
    fi
}

function testaur {
    _L=('artwork-maia'
	'atom-editor-arch'
	'atom-editor-beta'
	'atom-editor-git'
	'foobnix'
	'maia-gtk-theme'
	'moksha'
	'moksha-detour-theme-git'
	'moksha-forum-theme-git'
	'moksha-kl4k-theme-git'
	'moksha-module-cpu-git'
	'moksha-module-deskshow-git'
	'moksha-module-diskio-git'
	'moksha-module-emprint-git'
	'moksha-module-mem-git'
	'moksha-module-net-git'
	'moksha-modules-extra-git'
	'moksha-radiance-theme-git'
	'moksha-seven-theme-git'
	'moksha-vision-theme-git'
	'nyaovim'
	'python-interruptingcow'
	'python2-interruptingcow'
	'shadow-icon-theme-git'
	'yosembiance-git')
    for i in "${_L[@]}"
    do
         if ! [[ -d $HOME/AUR/$i ]]; then
              git clone ssh+git://aur@aur.archlinux.org/"$i".git "$HOME/AUR/$i"
         fi
         cd $HOME/AUR/$i
         makepkg -sf --noconfirm || (printf "Making $i failed; exitting" && exit)
         namcap *.xz > namcap-pkg.log
         namcap PKGBUILD > namcap-pkgbuild.log
         cd -
    done
}
