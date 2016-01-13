source ~/antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle tarruda/zsh-autosuggestions
antigen theme gentoo
# Enable autosuggestions automatically.
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init
antigen apply

for i in ~/Shell/*.sh
do
	. "$i"
done
