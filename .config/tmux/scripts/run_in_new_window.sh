#!/bin/bash

CMD="$1"
SHELL_CMD="zsh"
CURRENT_CMD=$(tmux display-message -p '#{pane_current_command}')
CURRENT_PATH=$(tmux display-message -p '#{pane_current_path}')

if [ "$CURRENT_CMD" = "$SHELL_CMD" ]; then
  tmux send-keys "$CMD" C-m
else
  tmux split-window -v -c "$CURRENT_PATH" "$SHELL_CMD -i -c '$CMD; exec $SHELL_CMD'"
fi
