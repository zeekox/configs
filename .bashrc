# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PATH=$PATH:$HOME/bin

# Color prompt
# jusqu'à \] pour le titre
PS1='\[\033]0; \w`__git_ps1`\007\] \[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\033[0;31m\]`__git_ps1`\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# User specific aliases and functions

set export EDITOR=vim
set export LC_TIME=en_GB

alias sus="sudo pm-suspend"
alias bye="sudo shutdown -h now"
alias vaw="vim ~/.config/awesome/rc.lua"

# multigit complete
source ~/bin/git-completion.bash

__git_complete mg __git_main
    	     
