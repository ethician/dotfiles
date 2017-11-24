#////////
#// Vars

DIR="${HOME}/.dotfiles/zsh"
HISTFILE=~/.zsh_history
SAVEHIST=1000 

setopt inc_append_history # To save every command before it is executed 
setopt share_history # setopt inc_append_history

#///////////
#// Aliases

alias ll="ls -la"

#////////////
#// Settings

export VISUAL=vim
stty -ixon  # for vim mappings


# For vim mappings: 

#////////////
#// Settings

source ${DIR}/plugins/fixls.zsh
source ${DIR}/plugins/oh-my-zsh/lib/history.zsh
source ${DIR}/plugins/oh-my-zsh/lib/key-bindings.zsh
source ${DIR}/plugins/oh-my-zsh/lib/completion.zsh
source ${DIR}/keybindings.sh
source ${DIR}/prompt.sh

set_prompt

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi
