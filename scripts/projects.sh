#!/bin/bash


function create_session {
    tmux start-server
    tmux new-session -d -s $session -n "editor"
    tmux send-keys "cd $HOME/Documents/Projects/" C-m C-l
    tmux new-window -t $session:1 -n "run"
    tmux select-window -t $session:0
    tmux a
}
session="prog"
# check if there is a tmux session
if [[ -n $(pgrep tmux) ]];then
    # attach to previous session
    tmux a
else
    create_session
fi
