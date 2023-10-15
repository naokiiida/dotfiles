# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# User specific aliases and functions
export CLICOLOR=1
# show hidden files
alias l.='ls -d .*'
# all files with / at the end of directories
alias la='ls -aF'
# make the dir command work kinda like in windows (long format) with human readable size values
alias dir='ls -hl'
# make grep highlight results using color
alias grep='grep --color=auto'

#brew shell completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
autoload -U compinit
compinit -i

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
# explicit locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# bitwarden cli
eval "$(bw completion --shell zsh); compdef _bw bw;"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#vi mode
export KEYTIMEOUT=1
source $HOME/.zsh-vi-mode/zsh-vi-mode.plugin.zsh
