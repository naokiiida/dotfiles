# explicit locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export VISUAL=hx
export EDITOR=hx
export MANPAGER='less -s -M +Gg'
export CLICOLOR=1

# parallel make
export MAKEFLAGS='-j 8'

#XDG Base Directory for cli Applications
if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ -z "$XDG_DATA_HOME" ] ; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi
if [ -z "$XDG_CACHE_HOME" ] ; then
    export XDG_CACHE_HOME="/Users/naokiiida/Library/Caches/XDG-cache"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# pnpm
export PNPM_HOME="/Users/naokiiida/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# For Flutter Dev
export CHROME_EXECUTABLE="/Applications/Google Chrome Dev.app/Contents/MacOS/Google Chrome Dev"
. "$HOME/.cargo/env"
