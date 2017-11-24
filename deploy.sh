#!/bin/sh

check_home() {
  if [ -z "${HOME}" -o ! -d "${HOME}" ]; then
    echo " € cannot read \$HOME\nEnter home directory location:"
    read $HOME
    if [ -z "${HOME}" -o ! -d "${HOME}" ]; then
      echo " € cannot read \$HOME | exiting..."
      exit 1
    fi
  fi
}

try_create_backup() {
  [ -z "${1}" -o ! -e "${1}" ] && return
  if [ -h "${1}" ]; then
    echo " • removed symlink to ${1}"
    rm -f ${1}
    return
  fi
  if [ ! -e "${1}-original" ]; then
    echo " • backed up ${1} to ${1}-original"
    mv ${1} ${1}-original
    return;
  fi
  local number=1
  while :
  do
    if [ ! -e "${1}-original-${number}" ]; then
      echo " • backed up ${1} to ${1}-original-${number}"
      mv ${1} ${1}-original-${number}
      break
    fi
    number=$(( ${number} + 1 ))
  done
}

create_backups() {
  try_create_backup "${HOME}/.dircolors"
  try_create_backup "${HOME}/.tmux"
  try_create_backup "${HOME}/.tmux.conf"
  try_create_backup "${HOME}/.vimrc"
  try_create_backup "${HOME}/.vim"
  try_create_backup "${HOME}/.zshrc"
}

clang_format_lookup() {
  [ -z "${1}" -o -z "${2}" ] && return
  echo " • looking up clang-format*.py in ${1}"
  [ -e "${1}" ] && find ${1} -name "clang-format*.py" >> ${2}
}

deploy_clang_format() {
  rm -f clang-format/clang-format.py
  rm -f clang-format/finds
  touch clang-format/finds
  clang_format_lookup "/usr/share" "clang-format/finds"
  clang_format_lookup "/usr/local/share" "clang-format/finds"
  clang_format_lookup "/opt/local" "clang-format/finds"
  if [ ! -s "clang-format/finds" ]; then
    # no clang-format*.py found in those locations
    rm -f clang-format/finds
    echo " € no clang-format*.py find"
    echo -n "Enter clang-format*.py location: "
    read finds
    [ -z "${finds}" ] && return
  else
    echo "Available clang-format*.py: "
    printf " %2d. none\n" 0
    local count=1
    while IFS= read line
    do
      printf " %2d. ${line}\n" ${count}
      count=$(( $count + 1 ))
    done < "clang-format/finds"
    echo -n "Make a selection: "
    read index
    if [ ${index} -ge ${count} ]; then
      echo " € nice try smarta\$\$"
      rm -f clang-format/finds
      return
    fi
    if [ ${index} -eq 0 ]; then
      rm -f clang-format/finds
      return
    fi
    finds=$(sed "${index}q;d" clang-format/finds)
    rm -f clang-format/finds
  fi
  local cwd=$(pwd)
  cd clang-format
  ln -s ${finds} clang-format.py
  echo " • created symlink $(pwd)/clang-format.py"
  cd ${cwd}
  try_create_backup "${HOME}/.clang-format"
  cp clang-format/clang-format ${HOME}/.clang-format
  echo " • created file ${HOME}/.clang-format"
}

deploy() {
  printf "source-file ${HOME}/.dotfiles/tmux/tmux.conf\n" > ${HOME}/.tmux.conf
  echo " • created file ${HOME}/.tmux.conf"
  printf "so ${HOME}/.dotfiles/vim/vimrc.vim\n" > ${HOME}/.vimrc
  echo " • created file ${HOME}/.vimrc"
  printf "source ${HOME}/.dotfiles/zsh/zshrc.zsh\n" > ${HOME}/.zshrc
  echo " • created file ${HOME}/.zshrc"
  cp colors/dircolors ${HOME}/.dircolors
  echo " • created file ${HOME}/.dircolors"
  local cwd=$(pwd)
  cd ${HOME}
  ln -s ${cwd}/tmux/tmux .tmux
  echo " • created symlink ${HOME}/.tmux"
  ln -s ${cwd}/vim/vim .vim
  echo " • created symlink ${HOME}/.vim"
  cd ${cwd}
  deploy_clang_format
}

check_home
create_backups
deploy
