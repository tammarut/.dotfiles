# Setup fzf
# ---------
if [[ ! "$PATH" == */home/khunpleum/.config/nvim/autoload/plugged/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/khunpleum/.config/nvim/autoload/plugged/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/khunpleum/.config/nvim/autoload/plugged/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/khunpleum/.config/nvim/autoload/plugged/fzf/shell/key-bindings.bash"
