#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Day-of-week emoji (0=Sun, 1=Mon, 2=Tue, 3=Wed, 4=Thu, 5=Fri, 6=Sat)
_day_emojis=(☀️  💀 🔥 🥘 🔨 🍺 🎉)
_day_emoji() { echo "${_day_emojis[$(date +%w)]}"; }

# Normal prompt (hh:mm [<username>@<hostname> <dir>] $)
# export PS1='\[\e[36m\]\A\[\e[m\] [\[\e[32m\]hakon\[\e[m\]@\[\e[32m\]\h\[\e[m\] \W] \[\e[36m\]\\$\[\e[m\] '

# Normal with WSL text (hh:mm [<username>@WSL <dir>] $)
#export PS1='\[\e[36m\]\A\[\e[m\] [\[\e[32m\]\u\[\e[m\]@\[\e[38;5;178m\]WSL\[\e[m\] \W] \[\e[36m\]\\$\[\e[m\] '

# With emoji
export PS1='\[\e[36m\]\A\[\e[m\] [\[\e[32m\]hakon\[\e[m\] $(_day_emoji)  \W] \[\e[36m\]\\$\[\e[m\] '

# Enable ls colorized
# and other ls aliases
alias ls='ls --color=auto'
alias la="ls -a"
alias ll="ls -la"
alias sl="sl -l"

# cd aliases
alias ..="cd .."
alias ...="cd ../.."

# Clear screen with clr
alias clr="clear"

# Open windows exporer to current working directory
alias here="explorer ."

# Use neovim
alias vim="nvim"

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

# Typo
alias gti="git"

# sl command (essential)
alias sl="wsl sl -l"

# Copy tree to clipboard
alias tree="wsl tree --gitignore | iconv -f utf-8 -t utf-16le | clip"

# Load custom bashrc for specific setup
# source ~/.secondarybashrc

export PATH=$PATH:~/.scripts/
export DISPLAY=:0.0
