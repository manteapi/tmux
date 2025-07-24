#!/bin/bash

CMD="$1"
SHELL_CMD="zsh"
CURRENT_CMD=$(tmux display-message -p '#{pane_current_command}')
CURRENT_PATH=$(tmux display-message -p '#{pane_current_path}')

if [ "$CURRENT_CMD" = "$SHELL_CMD" ]; then
  tmux new-window -c "$CURRENT_PATH" "$SHELL_CMD -i -c '$CMD'"
else
  tmux new-window -c "$CURRENT_PATH" "$SHELL_CMD -i -c '$CMD'"
fi
