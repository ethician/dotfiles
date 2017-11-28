if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
  tmux attach-session -t ssh || tmux new-session -s ssh
fi
