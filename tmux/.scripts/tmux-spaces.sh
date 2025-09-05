#!/bin/sh

CFG_FILE="$HOME/.scripts/spaces.json"
SESSION_NAME=main

if [[ "$1" == "DEBUG" ]]; then
  DEBUG=1
elif [[ -n $(jq -r ".[].name" < $CFG_FILE | grep "$1") ]]; then
  ARG_NAME="$1"
fi

# Run with ts DEBUG to do a dry run
run() {
  if [[ "$DEBUG" ]]; then
    echo $1
  else
    eval "$1"
  fi
}

if [[ -n "$ARG_NAME" ]]; then
  NAME="$ARG_NAME"
else
  NAME=$(jq -r '.[].name' < $CFG_FILE | fzf)
fi

if [ -n "$NAME" ]; then
  tmux list-sessions 2>/dev/null
  if [[ "$?" != "0" ]]; then
    TMUX_NOT_RUNNING=1
    TMUX_COMMAND="new-session -d -s $SESSION_NAME -x - -y -"
  else
    TMUX_COMMAND=new-window
  fi

  CFG=$(jq -r ".[] | select(.name == \"$NAME\")" < $CFG_FILE)
  if [[ -z "$CFG" ]]; then
    echo "Config not found" &>2
    exit 404;
  fi
  WORKING_DIR=$(echo $CFG | jq -r '.cwd')
  LAYOUT=$(echo $CFG | jq -r '.layout')
  COMMAND=$(echo $CFG | jq -r '.command')

  # Check if there is already a window by that name
  WINDOW_NAME=$NAME
  WINDOW_EXISTS=$(tmux list-windows -F '#{window_name}' 2>/dev/null | grep "$WINDOW_NAME")
  NUMBER=2
  until [[ -z $WINDOW_EXISTS ]]; do
    WINDOW_NAME="$NAME$NUMBER"
    WINDOW_EXISTS=$(tmux list-windows -F '#{window_name}' 2>/dev/null | grep "$WINDOW_NAME")
    NUMBER=$(($NUMBER + 1))
  done

  # Launch tmux session or create a new window in current session
  run "tmux $TMUX_COMMAND -n $WINDOW_NAME -c $WORKING_DIR $COMMAND"
  if [ "$WINDOW_NAME" = "$NAME" -a "$LAYOUT" = "main-aux" ]; then
    run "tmux split-window -t $SESSION_NAME:$WINDOW_NAME -l 8 -c $WORKING_DIR"
    run "tmux select-pane -t $SESSION_NAME:$WINDOW_NAME.0"
  fi
  if [[ "$TMUX_NOT_RUNNING" ]]; then
    run "tmux attach -t $SESSION_NAME"
  fi
fi
