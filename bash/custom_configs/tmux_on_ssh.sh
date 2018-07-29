tmux=$(which tmux)
if [ -n "${tmux}" -a -z "${TMUX}" -a -n "${SSH_CONNECTION}" ]; then
  unset tmux

  socketdir="/tmp/tmux-shared"
  socket="${socketdir}/default"
  if [ ! -d "${socketdir}" ]; then
    mkdir -p ${socketdir}
    chmod 0777 ${socketdir}
  fi

  echo ""

  if [ ! -S "${socket}" ]; then
    echo "TMUX | No sessions available!"
  else
    echo "TMUX | List of available sessions:"
    tmux -S ${socket} ls
  fi

  echo -n "TMUX | Select which session to connect to or create new (or type none): "
  read session

  if [ "${session}" != "none" ]; then
    tmux -S ${socket} attach -t ${session}
    if [ $? -gt 0 ]; then
      tmux -S ${socket} new-session -d -s ${session}
      chmod 0777 ${socket}
      tmux -S ${socket} rename-session ${session}
      tmux -S ${socket} attach -t ${session}
    fi
  fi
fi
