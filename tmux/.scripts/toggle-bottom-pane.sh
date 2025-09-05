#!/bin/sh
# if there is only one pane, create the bottom pane and switch to it
NUM_PANES=$(tmux list-panes | wc -l)
if [[ "$NUM_PANES" -lt 2 ]]; then
  tmux split-window -l 8 -c "#{pane_current_path}"
  exit 0
fi
# if there are multiple panes, and one is zoomed, then unzoom and switch to last pane (-1)
tmux list-panes -F '#F' | grep -q Z
if [[ "$?" == "0" ]]; then
  tmux select-pane -t :.-1
  exit 0
fi
# if there are multiple panes, and none are zoomed, then zoom the main pane (#0)
tmux resize-pane -Z -t :.0
