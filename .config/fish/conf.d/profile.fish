# USER=niida
# MAIL=niida@student.42tokyo.jp
# explicit locale
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x VISUAL hx
set -x EDITOR hx
set -x MANPAGER 'less -s -M +Gg'
set -x CLICOLOR 1

# parallel make
set -x MAKEFLAGS -j8

#XDG Base Directory for cli Applications
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CACHE_HOME /Users/naokiiida/Library/Caches/XDG-cache
set -x XDG_STATE_HOME "$HOME/.local/state"
set -x XDG_RUNTIME_DIR "/run/user/$UID"

#enforce XDG_CONFIG_HOME usage
set -x ANDROID_USER_HOME "$XDG_DATA_HOME"/android
set -x ANSIBLE_HOME "$XDG_DATA_HOME"/ansible
set -x CARGO_HOME "$XDG_DATA_HOME"/cargo
set -x DOCKER_CONFIG "$XDG_CONFIG_HOME"/docker
set -x BUNDLE_USER_CONFIG "$XDG_CONFIG_HOME"/bundle
set -x BUNDLE_USER_CACHE "$XDG_CACHE_HOME"/bundle
set -x BUNDLE_USER_PLUGIN "$XDG_DATA_HOME"/bundl
set -x GEM_HOME "$XDG_DATA_HOME"/gem
set -x GEM_SPEC_CACHE "$XDG_CACHE_HOME"/gem
set -x GOPATH "$XDG_DATA_HOME"/go
# defaults write org.hammerspoon.Hammerspoon MJConfigFile "$XDG_CONFIG_HOME"/hammerspoon/init.lua # Run this once manually, not on every shell startup
set -x IPYTHONDIR "$XDG_CONFIG_HOME/ipython"
set -x JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME"/jupyter
set -x LESSHISTFILE "$XDG_STATE_HOME"/less/history
set -x NODE_REPL_HISTORY "$XDG_DATA_HOME"/node_repl_history
set -x PARALLEL_HOME "$XDG_CONFIG_HOME"/parallel
set -x ZDOTDIR "$HOME"/.config/zsh
set -x RUSTUP_HOME "$XDG_DATA_HOME"/rustup
set -x SQLITE_HISTORY "$XDG_CACHE_HOME"/sqlite_history
set -x VAGRANT_HOME "$XDG_DATA_HOME"/vagrant
set -x WAKATIME_HOME $XDG_CONFIG_HOME/wakatime

# LLVM and C configuration
# set -x PATH /opt/homebrew/opt/llvm/bin $PATH
fish_add_path /opt/homebrew/opt/llvm/bin
set -x LDFLAGS -L/opt/homebrew/opt/llvm/lib
set -x CPPFLAGS -I/opt/homebrew/opt/llvm/include

# minilibx
set -x MANPATH $MANPATH /Users/naokiiida/Documents/42/42cursus/cub3d/minilibx_mms_20200219/man

# go installed packages
# set -x PATH $PATH /Users/naokiiida/go/bin
fish_add_path /Users/naokiiida/go/bin
set -x GOPATH /Users/naokiiida/go

# bun
# set -x BUN_INSTALL "$HOME/.bun"
# set -x PATH "$PATH:$BUN_INSTALL/bin"
fish_add_path "/Users/naokiiida/Library/Caches/XDG-cache/.bun/bin"

# For Flutter Dev
fish_add_path /Users/naokiiida/.pub-cache/bin
set -x CHROME_EXECUTABLE "/Applications/Google Chrome Dev.app/Contents/MacOS/Google Chrome Dev"

# rust
fish_add_path $HOME/.cargo/bin

# fzf with fd
set -x FZF_DEFAULT_COMMAND 'fd --type file'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

set -x RIPGREP_CONFIG_PATH "$XDG_CONFIG_HOME/ripgrep/config"
set -Ux NULLCLAW_HOME "$XDG_CONFIG_HOME/nullclaw"
set -x PATH $PATH /Applications/Obsidian.app/Contents/MacOS
