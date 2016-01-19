
alias ls='ls --color=auto'
PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;31m\]\$\[\e[m\] \[\e[1;37m\]'
for i in ~/Shell/*.sh
do
	. "$i"
done
