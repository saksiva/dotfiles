#
# ~/.bashrc
#

export EDITOR="vim"
export BROWSER="chrome"

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [[ "$(tty)" = "/dev/tty" ]]; then
  startx
fi

#sudo wpa_supplicant -B -i wlp2s0 -c /home/sak/network.conf
#sudo dhcpcd wlp2s0

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Enable tab completion
source ~/git-completion.bash

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"


gclonecd() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

alias ls='lsd'

function lc () {
  cd $1
   ls
}

alias atom="/usr/bin/atom"
alias c="clear"
alias y="youtube-dl --extract-audio --audio-format mp3 "
alias yt="youtube-dl -f 'bestvideo[height<=480]+bestaudio/best[height<=480]' "
alias update="sudo pacman -Suy"
alias key="xkbcomp -w 0 xkbmap $DISPLAY"
alias db="sudo systemctl start postgresql.service"
alias bt="sudo systemctl start bluetooth.service"
alias btstop="sudo systemctl stop bluetooth.service"
alias cd="lc"
alias gc="gclonecd"
alias ex="source ~/.bash_profile"

#powerline
function _update_ps1() {
  PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
