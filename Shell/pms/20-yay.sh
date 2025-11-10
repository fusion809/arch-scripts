function yayup {
	yay -Syu --noconfirm
	hyprpm_update
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
