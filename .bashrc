#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \['
PS1='\
\[\e[1m\]\
\[\e[48;5;39m\]\
 \u \
\[\e[38;5;59m\]♦ \[\e[0m\]\\
\[\e[48;5;59m\]\
 \w \[\e[0m\]\\
\[\e[38;5;59m\]\
\[\e[48;5;39m\]\
 ♦\
\[\e[0m\]\\
\[\e[48;5;34m\]\
 \$\
\[\e[48;5;39m\] \
\[\e[0m\]\
 '

 . $HOME/Shell/01-common.sh

 for i in $HOME/Shell/{02,03,04,05,06,07,08,09,1}*.sh
 do
   . "$i"
 done
