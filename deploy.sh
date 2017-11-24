#!/bin/sh

function check_home() {
  if [ -z ${HOME} -o ! -d ${HOME} ]; then
    echo "€ | cannot read \$HOME\nEnter home directory location:"
    read $HOME
    if [ -z ${HOME} -o ! -d ${HOME} ]; then
      echo "€ | cannot read \$HOME | exiting..."
      exit 1
    fi
  fi
}

function try_create_backup() {
  [ -z ${1} -o ! -e ${1} ] && return
  mv ${1} ${1}-original
}

function create_backups() {
  try_create_backup "${HOME}/.tmux"
  try_create_backup "${HOME}/.tmux.conf"
  try_create_backup "${HOME}/.vimrc"
  try_create_backup "${HOME}/.vim"
  try_create_backup "${HOME}/.zshrc"
}

function deploy() {
  printf "source '${HOME}/.dotfiles/zsh/zshrc.zsh'" > ${HOME}/.zshrc
  printf "so ${HOME}/.dotfiles/vim/vimrc.vim" > ${HOME}/.vimrc
  printf "source-file ${HOME}/.dotfiles/tmux/tmux.conf" > ${HOME}/.tmux.conf
}

check_home
create_backups
deploy
