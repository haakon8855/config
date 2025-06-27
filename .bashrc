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

alias here="explorer ."

# alias oned="cd 'c:/Users/haako/OneDrive - NTNU/'"
alias drive="cd 'G:/My Drive/'"

# Python
alias py="python"
alias pip="pip3"

# alias for opening todo.md
alias todo="vim ~/todo.md"

# Chocolatey package manager
alias chocolist="choco list"

# Winget package manager
alias ins="winget install"
alias rem="winget uninstall"
alias upd="winget update"
alias search="winget search"

alias sl="wsl sl -l"

# Function opening a folder or file in Visual Studio 2022 and resuming the terminal
visual(){
	local path="$1"
	"C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe" "$path" &
}


bind -x '"\e[1;3S":"exit"'

# # The Fuck
# export PYTHONIOENCODING=utf-8
# eval "$(thefuck --alias)"

export PATH=$PATH:~/.scripts/
export DISPLAY=:0.0
