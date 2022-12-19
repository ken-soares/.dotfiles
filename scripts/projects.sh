#!/bin/bash

# check if there is a tmux session
if [[ -n $(pgrep tmux) ]];then
    # attach to previous session
    kitty -e tmux a
else
    # create a new tmux session
    kitty -e tmux
fi
