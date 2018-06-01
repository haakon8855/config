#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export PS1='\[\e[36m\]\A\[\e[m\] [\[\e[32m\]\u\[\e[m\]@\[\e[32m\]\h\[\e[m\] \W] \[\e[36m\]\\$\[\e[m\] '

alias la="ls -a"
alias ll="ls -la"
alias ins="sudo pacman -S"
alias rem="sudo pacman -R"
alias upg="sudo pacman -Syu"
alias search="sudo pacman -Ss"
alias clr="clear"
alias py="python3.6"
alias du="du -h"
alias sl="sl -l"
alias pacman_installed="cat /var/log/pacman.log | grep -iE installed"
alias copy="rsync --info=progress2"

export PATH=$PATH:~/.scripts/
