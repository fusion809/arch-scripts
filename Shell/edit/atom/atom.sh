# Arch User Repository
function edau {
	atom $HOME/AUR
}

# Menus
function edmen {
	sudo atom /etc/xdg/menus && sudo atom /usr/share/desktop-directories
}

# Oh My Zsh plugins
function edzp {
	atom $HOME/.oh-my-zsh/plugins
}

# Oh My Zsh themes
function edzt {
	atom $HOME/.oh-my-zsh/themes/
}
