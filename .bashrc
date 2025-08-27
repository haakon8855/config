#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Custom prompt (hh:mm [<username>@<hostname> <dir>] $)
export PS1='\[\e[36m\]\A\[\e[m\] [\[\e[32m\]\u\[\e[m\]@\[\e[32m\]\h\[\e[m\] \W] \[\e[36m\]\\$\[\e[m\] '

# Enable ls colorized
# and other ls aliases
alias ls='ls --color=auto'
alias la="ls -a"
alias ll="ls -la"
alias sl="sl -l"

# Clear screen with clr
alias clr="clear"

# Open windows exporer to current working directory
alias here="explorer ."

# cd to Google Drive
alias drive="cd 'G:/My Drive/'"

# Python aliases
alias py="python"
alias pip="pip3"

# Open todo.md in vim
alias todo="vim ~/todo.md"

# Winget package manager
alias ins="winget install"
alias rem="winget uninstall"
alias upd="winget update"
alias search="winget search"

# Typos
alias gti="git"

# sl command (essential)
alias sl="wsl sl -l"

export PATH=$PATH:~/.scripts/
export DISPLAY=:0.0
