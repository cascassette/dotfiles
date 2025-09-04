#!/bin/sh

CFG_FILE="$HOME/.scripts/spaces.json"

NAME=$(jq -r '.[].name' < $CFG_FILE | fzf)
if [ -n "$NAME" ]; then
  SESSION_EXISTS=$(tmux list-sessions)
  if [[ -n "$SESSION_EXISTS" ]]; then
    TMUX_COMMAND=new-window
  else
    TMUX_COMMAND=new-session
  fi

  CFG=$(jq -r ".[] | select(.name == \"$NAME\")" < $CFG_FILE)
  if [[ -z "$CFG" ]]; then exit 404; fi
  WORKING_DIR=$(echo $CFG | jq -r '.cwd')
  LAYOUT=$(echo $CFG | jq -r '.layout')
  COMMAND=$(echo $CFG | jq -r '.command')

  # Check if there is already a window by that name
  WINDOW_NAME=$NAME
  WINDOW_EXISTS=$(tmux list-windows -F '#{window_name}' | grep "$WINDOW_NAME")
  NUMBER=2
  until [[ -z $WINDOW_EXISTS ]]; do
    WINDOW_NAME="$NAME$NUMBER"
    WINDOW_EXISTS=$(tmux list-windows -F '#{window_name}' | grep "$WINDOW_NAME")
    NUMBER=$(($NUMBER + 1))
  done
  tmux TMUX_COMMAND -n $WINDOW_NAME -c $WORKING_DIR $COMMAND
  if [ "$WINDOW_NAME" = "$NAME" -a "$LAYOUT" = "main-aux" ]; then
    tmux split-window -t $WINDOW_NAME -l 8 -c $WORKING_DIR
    tmux select-pane -t $WINDOW_NAME.0
  fi
fi
