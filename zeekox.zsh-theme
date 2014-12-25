#!/usr/bin/env zsh

source $ZSH/themes/pure.zsh-theme

zstyle ':vcs_info:*:*' formats "%r/%S %F{green}%b%u%c"
zstyle ':vcs_info:*:*' actionformats "%r/%S %F{green}%b%u%c %F{yellow}%a%f"
