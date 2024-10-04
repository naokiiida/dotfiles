export KEYTMEOUT=1
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# User specific aliases and functions

# show hidden files
alias l.='ls -d .*'
# all files with / at the end of directories
alias la='ls -aF'
# make the dir command work kinda like in windows (long format) with human readable size values
alias dir='ls -hl'
# make grep highlight results using color
alias grep='grep --color=auto'

# custom directories
alias 42="cd '/Users/naokiiida/Documents/42/42cursus'"

alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

find_man() {
    man $1 | grep -- $2
}

p() {
  if [[ -f bun.lockb ]]; then
    command bun "$@"
  elif [[ -f pnpm-lock.yaml ]]; then
    command pnpm "$@"
  elif [[ -f deno.json ]]; then
    command deno "$@"
  elif [[ -f yarn.lock ]]; then
    command pnpm import
  elif [[ -f package-lock.json ]]; then
    command pnpm import
  else
    command pnpm "$@"
  fi
}
