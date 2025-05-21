# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
# Fish uses `fish_add_path` instead of `export PATH` modify $PATH.
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
fish_add_path /opt/homebrew/bin/

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Alias
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
alias vi nvim
alias vim nvim
alias gti git # typos

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Eza
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Requires `brew install eza`
if type -q eza
	alias ls eza
	alias l 'eza -ahGxTL 1 -s type --icons'
	alias ll 'eza -alhbTL 1 --long --git --icons'
	alias la 'eza -lbhHigUmuSa --time-style=long-iso --git --color-scale'
	alias llm 'eza -lbGd --git --sort=modified' # long list, modified date sort
	alias lx 'eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

	# specialty views
	alias lS 'eza -1' # one column, just names
end

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Volta (JavaScript Tool Manager)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -gx VOLTA_HOME $HOME/.volta
set PATH $VOLTA_HOME/bin $PATH

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Golang Path
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# No need to set GOROOT in fish (use `go env GOROOT`)
set -gx GOPATH $HOME/go
set PATH $PATH $GOPATH/bin
set PATH $PATH $GOROOT/bin

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# pnpm
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -gx PNPM_HOME /Users/arima/Library/pnpm
set PATH $PNPM_HOME $PATH


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# FZF command-line fuzzy finder
# Set up fzf key bindings
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
fzf --fish | source

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Enable zoxide (z)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
zoxide init fish | source

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Enable starship prompt
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
starship init fish | source

if status is-interactive
	# Commands to run in interactive sessions can go here
end

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# OrbStack
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
