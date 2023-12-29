export KEYTIMEOUT=1
export VISUAL=mvim
# explicit locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

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

#brew shell completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
autoload -U compinit
compinit -i

# pnpm
export PNPM_HOME="/Users/naokiiida/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# zig
export ZIG_HOME="/Users/naokiiida/Applications/zig-macos-x86_64-0.11.0"
case ":$PATH:" in
  *":$ZIG_HOME:"*) ;;
  *) export PATH="$ZIG_HOME:$PATH" ;;
esac
# zig end


# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
