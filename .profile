# USER=niida
# MAIL=niida@student.42tokyo.jp
# explicit locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export VISUAL=hx
export EDITOR=hx
export MANPAGER='less -s -M +Gg'
export CLICOLOR=1

# parallel make
export MAKEFLAGS='-j8'

#XDG Base Directory for cli Applications
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="/Users/naokiiida/Library/Caches/XDG-cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/run/user/$UID"

#enforce XDG_CONFIG_HOME usage
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export ANSIBLE_HOME="$XDG_DATA_HOME"/ansible
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundl
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export GOPATH="$XDG_DATA_HOME"/go
defaults write org.hammerspoon.Hammerspoon MJConfigFile "$XDG_CONFIG_HOME"/hammerspoon/init.lua
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export ZDOTDIR="$HOME"/.config/zsh
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
export VAGRANT_HOME="$XDG_DATA_HOME"/vagrant

# homebrew configuration
eval "$(/opt/homebrew/bin/brew shellenv)"

# LLVM and C configuration
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# go installed packages
export PATH="$PATH:/Users/naokiiida/go/bin"
export GOPATH="/Users/naokiiida/go"

# # bun
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$PATH:$BUN_INSTALL/bin"
# pnpm
export PNPM_HOME="/Users/naokiiida/Library/pnpm"
export PATH="$PATH:$PNPM_HOME"
# pnpm end

# For Flutter Dev
export CHROME_EXECUTABLE="/Applications/Google Chrome Dev.app/Contents/MacOS/Google Chrome Dev"
export PATH="$HOME/.cargo/bin:$PATH"

# fzf with fd
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# minilibx
export MANPATH=/Users/naokiiida/Documents/42/42cursus/cub3d/minilibx_mms_20200219/man$MANPATH

#DOCKER COMPOSE
# export COMPOSE_FILE="docker-compose.yml:compose.yml:compose.yaml:docker-compose.yaml"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/naokiiida/.lmstudio/bin"
# End of LM Studio CLI section
# . "/Users/naokiiida/.local/share/cargo/env"

export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/config"
