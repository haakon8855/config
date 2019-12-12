#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export PS1='\[\e[36m\]\A\[\e[m\] [\[\e[32m\]\u\[\e[m\]@\[\e[32m\]\h\[\e[m\] \W] \[\e[36m\]\\$\[\e[m\] '

alias la="ls -a"
alias ll="ls -la"
alias ins="sudo apt install"
alias rem="sudo apt remove"
alias upd="sudo apt update"
alias upg="sudo apt upgrade"
alias search="sudo apt-cache search"
alias clr="clear"
alias py="python3.8"
# alias du="du -h"
alias sl="sl -l"
# alias pacman_installed="cat /var/log/pacman.log | grep -iE installed"
# alias copy="rsync --info=progress2"

export PATH=$PATH:~/.scripts/
export PATH=$PATH:/snap/bin/
