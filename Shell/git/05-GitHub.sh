containsElement () {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

function gitc {
  export _atom=('fusion-ui'
                'language-archlinux'
                'language-gfm2'
                'language-ini-desktop'
                'language-liquid'
                'language-patch2'
                'language-shellscript'
                'terminal-fusion')

  export _editors=('spacemacs'
                   'vim')

  export _installers=('atom-installer'
                      'brackets-installer'
                      'komodo-installer'
                      'lighttable-installer'
                      'vscode-installer')

	export _packaging=('atom-editor'
						         'atom-editor-arch'
        						 'atom-editor-beta'
        						 'atom-editor-beta-arch'
        						 'atom-editor-fusion'
        						 'atom-editor-git'
        						 'atom-editor-nuclide'
        						 'atom-editor-platformio'
        						 'atom-editor-sync'
        						 'atom-editor-web'
        						 'blockify'
        						 'brackets'
        						 'codebox'
        						 'gvim'
        						 'gvim-git'
        						 'gvim-gtk3'
        						 'komodo-edit'
        						 'lighttable'
        						 'linux-ck'
        						 'messengerfordesktop'
        						 'PKGBUILDs'
        						 'ps_mem'
        						 'rpmbuild'
        						 'sabayon-tools'
        						 'shadow-icon-theme'
        						 'shadow-icon-theme-git'
        						 'sublime-text'
        						 'sublime-text-dev'
        						 'textadept'
        						 'visual-studio-code'
        						 'visual-studio-code-git'
        						 'visual-studio-code-oss')

  export _packer=('arch-builder'
                  'gentoo-packer')

  export _scripts=('arch-scripts'
                   'arch-setup'
                   'bin'
                   'centos-scripts'
                   'debian-scripts'
                   'fedora-scripts'
                   'gentoo-scripts'
                   'GNU_Octave'
                   'JScripts'
                   'mageia-scripts'
                   'npm2archOBS'
                   'opensuse-scripts'
                   'pclinuxos-scripts'
                   'python-scripts'
                   'sabayon-scripts'
                   'zsh-themes')

	for i in "$@"
	do
    # mkdir $GHUBM
		if ! [[ -d $GHUBM ]]; then
			mkdir -p $GHUBM
		fi

    if ! [[ -d $GHUBM/atom ]]; then
      mkdir -p $GHUBM/atom
    fi

    if ! [[ -d $GHUBM/packaging ]]; then
      mkdir -p $GHUBM/packaging
    fi

		if [[ $i == 'atom' ]]; then
      # Atom config repo
			if ! [[ -d $HOME/.atom ]]; then
				mkdir $HOME/.atom
        git clone https://github.com/fusion809/atom-editor-arch /tmp/atom-editor-arch
        pushd /tmp/atom-editor-arch
        makepkg -sif --noconfirm
        popd
			fi
			pushd $HOME/.atom
			gitsw
			git pull origin master
			popd -

		elif `containsElement "$i" "${_atom[@]}"`; then
      # Atom package/themes repos
      if ! [[ -d $GHUBM/atom/$i ]]; then
        git clone https://github.com/fusion809/$i.git $GHUBM/atom/$i
        pushd $GHUBM/atom/$i
        gitsw
        popd
      else
        pushd $GHUBM/atom/$i
        git pull origin master
        popd
      fi

    elif `containsElement "$i" "${_editors[@]}"`; then
      # editors repos
      if ! [[ -d $GHUBM/editors/$i ]]; then
        git clone https://github.com/fusion809/$i.git $GHUBM/editors/$i
        pushd $GHUBM/editors/$i
        gitsw
        popd
      else
        pushd $GHUBM/editors/$i
        git pull origin master
        popd
      fi

		elif `containsElement "$i" "${_packaging[@]}"`; then
      # Packaging repos
      if ! [[ -d $GHUBM/packaging/$i ]]; then
        git clone https://github.com/fusion809/$i.git $GHUBM/packaging/$i
        pushd $GHUBM/packaging/$i
        gitsw
        popd
      else
        pushd $GHUBM/packaging/$i
        git pull origin master
        popd
      fi

    elif `containsElement "$i" "${_packer[@]}"`; then
      # editors repos
      if ! [[ -d $GHUBM/packer/$i ]]; then
        git clone https://github.com/fusion809/$i.git $GHUBM/packer/$i
        pushd $GHUBM/packer/$i
        gitsw
        popd
      else
        pushd $GHUBM/packer/$i
        git pull origin master
        popd
      fi

		elif ! [[ -d $GHUBM/$i ]]; then
			git clone https://github.com/fusion809/$i.git $GHUBM/$i
      pushd $GHUBM/$i
      gitsw
      popd
		fi
	done
}

function gitsub {
	git submodule add git@github.com:fusion809/$1
}

function gitmv {
	for i in "$@"
	do
		pushd $GHUBM/packaging
		mv PKGBUILDs/$1 .
		cd $1 && git init && gitsw && hub create
		cp ../PKGBUILDs/.gitignore .
		push "Initial commit"
		cd ../PKGBUILDs && push "Moving $1 to own repo" && gitsub $1 && push "Adding $1 as submodule" && cd -
		popd
	done
}

function gitco {
	git clone https://github.com/$1/$2 $GHUBO/$2
}


function ginit {
	git init && git add --all && gitsw
}
