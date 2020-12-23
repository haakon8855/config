#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1='\[\e[36m\]\A\[\e[m\] [\[\e[32m\]\u\[\e[m\]@\[\e[32m\]\h\[\e[m\] \W] \[\e[36m\]\\$\[\e[m\] '

alias ls='ls --color=auto'			# ls colors
alias la="ls -a"				# ls show hidden
alias ll="ls -la"				# ls list show hidden

alias ins="sudo apt install"			# install
alias rem="sudo apt remove"			# uninstall
alias autorem="sudo apt autoremove"		# autoremove
alias upd="sudo apt update"			# update
alias upg="sudo apt upgrade"			# upgrade
alias search="sudo apt-cache search"		# search

alias clr="clear"				# clear terminal
alias sl="sl -l"				# tiny sl
alias here="xdg-open ."				# open explorer in cd

alias lstrash="ls ~/.local/share/Trash/files"
alias rmtrash="trash-empty"

# python
alias py="python3.8"
alias pip="pip3.8"

# java
alias java8="/usr/lib/jvm/java-8-openjdk-amd64/bin/java"

# django
alias runserver="py manage.py runserver"
alias createsu="py manage.py createsuperuser"
alias makemigrations="py manage.py makemigrations"
alias migrate="py manage.py migrate"

# Add stuff to PATH
export PATH=$PATH:~/.scripts/
export PATH=$PATH:/snap/bin/
export PATH=$PATH:/home/haako/.local/bin/

