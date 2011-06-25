#!/bin/bash

export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTTIMEFORMAT="%D %T "
export HISTIGNORE="&:ls:exit"
shopt -s histappend

export PATH="${PATH}:~/config/scripts:/usr/local/share/npm/bin"

#. ~/.bashrc
alias a='alias'

alias gvim='open -a MacVim'
alias mvim='gvim'
alias v='gvim'
alias grep='egrep --color'
alias igrep='grep -i'
alias ig='irgrep'
alias rgrep='grep -r'
alias rg='rgrep'
alias irgrep='grep -ir'
alias 'irg'='irgrep'

alias gs='git status'
alias gb='git branch'
alias gco='git checkout'
alias gc='git commit -am'
alias gr='git reset --hard HEAD'
alias gl='git log'
alias gd='git diff'

alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
rvm 1.9.2
