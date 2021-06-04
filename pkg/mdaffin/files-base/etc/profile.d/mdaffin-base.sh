export EDITOR='nvim'
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export PATH=$HOME/.local/bin:$PATH

alias ls=/usr/bin/exa

# Node
export PATH=$HOME/.local/share/npm/bin:$HOME/.yarn/bin:$PATH

# Go
export GOPATH=$HOME/projects/go
export PATH=$GOPATH/bin:$PATH

# Rust
export PATH=$HOME/.cargo/bin:$PATH

export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_OPTS='-m --height 50% --border'
