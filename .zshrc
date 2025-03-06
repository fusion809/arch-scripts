#!/bin/zsh
export TERM="xterm-256color"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_DISABLE_COMPFIX="true"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="hfulldate"

set enable-bracketed-paste off
setopt NO_NOMATCH

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git github zsh-syntax-highlighting vi-mode zsh-autosuggestions
#safe-paste zsh-completions
)
function pacsearch {
	sudo pacman -Ss $@
}
#autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh
source $HOME/.oh-my-zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
#
# # bind UP and DOWN arrow keys (compatibility fallback
# # for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
#
# # bind P and N for EMACS mode
# bindkey -M emacs '^P' history-substring-search-up
# bindkey -M emacs '^N' history-substring-search-down
#
# # bind k and j for VI mode
# bindkey -M vicmd 'k' history-substring-search-up
# bindkey -M vicmd 'j' history-substring-search-down
# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
for i in $HOME/Shell/*.sh
do
  . "$i"
done
unset zle_bracketed_paste

#source $HOME/Shell/pms/15-vim.sh

#while :
#do
#	sudo killall -q dde-osd
#done

export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin

if [[ "$(stat -c %d:%i /)" != "$(sudo stat -c %d:%i /proc/1/root/.)" ]]; then
  export DISPLAY=":0"
  export PULSE_SERVER=127.0.0.1
  printf "You may wish to run update_all_quiet_loop 5m.\n"
fi

#sudo mount /dev/sda4 /win
fixAudio() {
  pulseaudio --kill && sudo alsa force-reload
}

fixMic() {
	amixer $1 set Capture 100%
}

function plot {
	if [[ $PWD != "/data/Documents/USQ/Semester 3, 2021/Scholarship/Project/Coding" ]]; then
		cdsem3 Scholarship/Project/Coding
	fi

	if [[ $# -eq 1 ]]; then
		python plot.py $1
	elif [[ $# -gt 1 ]]; then
		for i in $@
		do
			if [[ -s output/ordinary/coords_and_vel_$i.csv ]] && [[ -s output/ordinary/parameters_$i.csv ]]; then
				echo "Plotting asteroid $i"
				python plot.py $i
			fi
		done
	fi
	cd -
}

function plotAll {
	plot {1..48}
}

function convPNG {
	if [[ $PWD != "/data/Documents/USQ/Semester 3, 2021/Scholarship/Project/Coding/plots/N1e8Noutputs1e4" ]]; then
		cdsem3 Scholarship/Project/Coding/plots/N1e8Noutputs1e4
	fi
	for i in Asteroid_$i_*back*.svg
	do
		convert ${i} png/${i/.svg/.png}
	done
	cd -
}

function convertAllToPNG {
	if [[ $PWD != "/data/Documents/USQ/Semester 3, 2021/Scholarship/Project/Coding/plots/N1e8Noutputs1e4" ]]; then
		cdsem3 Scholarship/Project/Coding/plots/N1e8Noutputs1e4
	fi
	for i in *back*.svg
	do
		convert ${i} png/${i/.svg/.png}
	done
	cd -
}

alias convAllPNG=convertAllToPNG
alias convAllpng=convertAllToPNG

function plotAndConvertAll {
	plotAll
	convertAllToPNG
}

function getName {
	NAME=$(wget -cqO- "https://ssd.jpl.nasa.gov/api/horizons.api?format=text&COMMAND='$1'&OBJ_DATA='YES'" | grep "Target body name" | cut -d '(' -f 2 | cut -d ')' -f 1)
	echo $NAME | xclip -selection c
}

function getAstName {
	cdsem3 Scholarship/Project
	getName $(cat save/416_svea.tab | head -n $1 | tail -n 1 | cut -d ' ' -f 1)
}

export PATH=$PATH:$HOME/.gem/ruby/3.0.0/bin:$HOME/.local/bin

. /mnt/d/.files/download.sh
. /data/Documents/USQ/MRes/MRes/Rcode/newRmd.sh

eval "$(ssh-agent -s)" &> /dev/null
ssh-add -q ~/.ssh/id_ed25519
ssh-add -q ~/.ssh/aur

ifunction openra {
	if [[ $@ == "--version" ]]; then
		pkgver=$(pacman -Qi openra-wts-git | grep Version | cut -d ':' -f 2 | sed 's/ //g' | cut -d '-' -f 1)
		echo "$pkgver"
	elif [[ $@ == "--gitversion" ]]; then
		openra_path="$HOME/AUR/openra-wts-git/src/OpenRA"
		no=$(comno ${openra_path})
		ghash=$(git -C ${openra_path} log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
		echo "$no.git.$ghash"
	fi
}
export DONT_PROMPT_WSL_INSTALL=true

function cdcvb {
	cd /mnt/c/Users/User/"VirtualBox VMs"/$1
}

function cdnc {
	cd /mnt/d/VirtualBox/Shared/NixOS-configs/$1
}

function cdrec {
	cdgm Recipes/$1
}

#function openra-ra {
#	cd $HOME/Applications
#	./$(ls $HOME/Applications | grep Red-Alert)
#}
