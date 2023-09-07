#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export PS1='\[\e[36m\]\A\[\e[m\] [\[\e[32m\]\u\[\e[m\]@\[\e[32m\]\h\[\e[m\] \W] \[\e[36m\]\\$\[\e[m\] '

# runc(){ # $1 is infile, $2 is outfile
	# local infile="$1"
	# local outfile=${infile%.*}
	# gcc "$infile" -o "$outfile"
	# ./"$outfile"
# }

alias la="ls -a"
alias ll="ls -la"
alias sl="sl -l"

alias clr="clear"

# alias oned="cd 'c:/Users/haako/OneDrive - NTNU/'"
alias drive="cd 'G:/My Drive/'"

# Python
alias py="python"
alias pip="pip3"

# alias for opening todo.md
alias todo="vim ~/todo.md"

# Chocolatey package manager
alias chocolist="choco list"
alias ins="choco install"
alias unins="choco uninstall"

# APT package manager
# alias ins="sudo apt install"
# alias rem="sudo apt remove"
# alias upd="sudo apt update"
# alias upg="sudo apt upgrade"
# alias search="sudo apt-cache search"


# Visual Studio
alias visual="'C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe'"


bind -x '"\e[1;3S":"exit"'

export PATH=$PATH:~/.scripts/
export DISPLAY=:0.0
