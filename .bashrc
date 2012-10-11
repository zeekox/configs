# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PATH=$PATH:$HOME/bin

# Color prompt
# first part till second \w for window title
PS1='\[\033]0; \w`__git_ps1`\007\]\[\e[0;32m\]\[\e[m\]\[\e[1;34m\]\w\[\033[0;31m\]`__git_ps1`\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# User specific aliases and functions

set export EDITOR=vim
set export LC_TIME=en_GB

set PYTHONPATH=/usr/local/lib/python2.7/site-packages

alias sus="sudo pm-suspend"
alias bye="sudo shutdown -h now"
alias vaw="gvim ~/.config/awesome/rc.lua &"
alias ls="ls --color"
alias ll="ls -l --color"
alias cdbl="cd ~/workspace/ndbjs-business-layer/"
alias cd7="cd ~/workspace/ndbjs-re7/"
alias cd5="cd ~/workspace/ndbjs-re5/"

# multigit complete
source ~/bin/git-completion.bash

__git_complete mg __git_main
