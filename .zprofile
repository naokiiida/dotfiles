# explicit locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

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
