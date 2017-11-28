tmux=$(which tmux)
if [ -n "${tmux}" -a -z "${TMUX}" -a "${SSH_CONNECTION}" != "" ]; then
  tmux attach-session -t ssh || tmux new-session -s ssh
  unset tmux
fi
