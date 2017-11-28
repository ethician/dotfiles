#//////////////////////////
#// interactive shell only

case $- in
  *i*)
    ;;
  *)
    return
    ;;
esac

#///////////
#// history

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

#//////////
#// color

[ "${COLORTERM}" == "gnome-terminal" ] && export TERM=xterm-256color
case "${TERM}" in
  xterm-*color|screen-*color|tmux-*color)
    color_prompt=yes
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

#//////////
#// prompt

if [ "${color_prompt}" = yes ]; then
  red='\033[1;31m'
  green='\033[1;32m'
  light_blue='\033[1;94m'
  nc='\033[0m'
  if [ ${EUID} -ne 0 ]; then
    PS1="\[${green}\]\u@\h\[${nc}\] \[${light_blue}\]\w\[${nc}\] \$ "
  else
    PS1="\[${red}\]\u@\h\[${nc}\] \[${light_blue}\]\w\[${nc}\] # "
  fi
else
  PS1='\u@\h \w \$ '
fi
unset color_prompt

# If this is an xterm set the title to user@host:dir
case "${TERM}" in
  xterm*|rxvt*)
    PS1="\[\e]0;\u@\h \w\a\]${PS1}"
    ;;
esac

#//////////////////
#// other settings

shopt -s checkwinsize
#shopt -s globstar
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#///////////////////
#// bash completion

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#//////////////////
#// custom configs

for custom_config in "${HOME}/.dotfiles/bash/custom_configs/*"
do
  source ${custom_config}
done
