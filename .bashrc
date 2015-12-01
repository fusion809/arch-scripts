#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

function update {
	yaourt -Syua --noconfirm
}

function pacup {
	sudo pacman -Syu --noconfirm
}

function pacin {
	sudo pacman -S $@ --noconfirm
}

function pacrm {
	sudo pacman -Rsc $@ --noconfirm
}

function nbash {	
	nano ~/.bashrc
}

function sbash {
	source ~/.bashrc
}

function yain {
	yaourt -Sy $@ --noconfirm
}

function trin {
	./configure --prefix=/usr && make && sudo make install
}

function atrin {
	./autogen.sh --prefix=/usr && make && sudo make install
}

function eapp {
	wget -cqO- https://download.enlightenment.org/rel/apps/$1/$1-$2.tar.xz | tar -xJ
	cd $1-$2
	trin
	cd ..
}

for i in ~/Shell/*.sh
do
    . "$i"
done
