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
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/run/user/$UID"

#enforce XDG_CONFIG_HOME usage
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export ANSIBLE_HOME="$XDG_DATA_HOME"/ansible
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export GOPATH="$XDG_DATA_HOME"/go
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export ZDOTDIR="$HOME"/.config/zsh
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
export VAGRANT_HOME="$XDG_DATA_HOME"/vagrant
export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"

# go installed packages
export PATH="$PATH:$XDG_DATA_HOME/go/bin"

# pnpm
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PATH="$PATH:$PNPM_HOME"

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# fzf with fd
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/config"
