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

eval "$(starship init zsh)"
