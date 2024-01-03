# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Alias
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Mim ⇨ Neovim
alias {vi,vim}=nvim

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Exa
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
if [ -x "$(command -v exa)" ]; then
	alias ls='exa'
	alias l='exa -hFGxTL 1 -s type --icons'
	alias ll='exa -lbGF --long --git'
	alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'
	alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
	alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

	# specialty views
	alias lS='exa -1'                                                              # one column, just names
	alias lt='exa --tree --level=2'                                         # tree
fi

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Volta (JavaScript Tool Manager)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
export VOLTA_HOME=$HOME/.volta
export PATH=$VOLTA_HOME/bin:$PATH

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Golang Path
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# export GOROOT=/opt/homebrew/bin/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# pnpm
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
export PNPM_HOME="/Users/arima/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Android SDK
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
export PATH=~/Library/Android/sdk/tools:$PATH
export PATH=~/Library/Android/sdk/platform-tools:$PATH

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Z.lua
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
. /opt/homebrew/etc/profile.d/z.sh

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Enable starship shell
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
eval "$(starship init zsh)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
