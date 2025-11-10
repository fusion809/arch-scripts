function yayup {
	yay -Syu --noconfirm
	if `which hyprland &> /dev/null`; then
		hypVer=$(hyprland --version | head -n 1 | cut -d ' ' -f 2)
		oldVer=$(cat $HOME/.cache/hyprland-version)
		if [[ $hypVer != $oldVer ]]; then
			hyprpm update
		fi
	fi
}

alias yayu=yayup
alias yau=yayup
alias yaup=yayup
alias pacaup=yayup

function yayi {
	yay -S "$@" --noconfirm
}

alias yayin=yayi
alias yain=yayi
alias yai=yayi
alias pacain=yayi

function yayr {
	yay -Rsc "$@" --noconfirm
}

alias yayrm=yayr
alias yarm=yayr
alias yar=yayr

function yays {
	yay -Ss "$@"
}

alias yas=yays
alias pacas=yas
