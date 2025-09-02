#!/bin/sh

# Old one liner command:
#find ~/Source/logius -type d -maxdepth 1 | grep -v logius$ | awk 'function basename(dir) { sub(\".*/\", \"\", dir); return dir } {print $0, basename($0)}' | fzf -n 1 --with-nth 2 | ~/open-new-tmux-pane.sh

CHOSEN_PROJECT=$(ls ~/.scripts/tmux-spaces/ | fzf)
if [ -n "$CHOSEN_PROJECT" ]; then
  ~/.scripts/tmux-spaces/$CHOSEN_PROJECT
fi
