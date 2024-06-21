# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/cas/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/cas/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/cas/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/cas/.fzf/shell/key-bindings.zsh"
