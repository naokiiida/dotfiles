export MAIL=niida@student.42tokyo.jp
export USER=niida
export GROUP=2020
export PATH="/Users/niida/Library/Python/3.9/bin:$PATH"

alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Sensible, short .zshrc
# Gist page: git.io/vSBRk  
# Raw file:  curl -L git.io/sensible-zshrc

lsflags="-GF"
export CLICOLOR=1

# Aliases
alias ls="ls ${lsflags}"
alias ll="ls ${lsflags} -l"
alias la="ls ${lsflags} -la"
alias h="history"
alias hg="history -1000 | grep -i"
alias ,="cd .."
alias m="less"
alias cw="cc -Wall -Wextra -Werror"
alias cwa="cc -Wall -Werror -Wextra *.c && ./a.out"
alias cwf="cc -Wall -Wextra -Werror -fsanitize=address -g3"
alias cwfa="cc -Wall -Wextra -Werror -fsanitize=address -g3 *.c && ./a.out"
alias pip-upgrade="pip install -U \$(pip list -o | awk 'NR>2 {print $1}')"

# Clear all cash for storage spaces
alias sweep="rm -Rfv /Library/Caches/* ~/Library/Caches/* 2> /dev/null"

# GIT
# Do this: git config --global url.ssh://git@github.com/.insteadOf https://github.com
alias gd="git diff"
alias gs="git status 2>/dev/null"
function gc() { git clone ssh://git@github.com/"$*" }
function gg() { git commit -m "$*" }

# More suitable for .zshenv
EDITOR=vim
PROMPT='%n@%m %3~
%(!.#.$)%(?.. [%?]) '

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history           # allow multiple sessions to append to one history
setopt bang_hist                # treat ! special during command expansion
setopt extended_history         # Write history in :start:elasped;command format
setopt hist_expire_dups_first   # expire duplicates first when trimming history
setopt hist_find_no_dups        # When searching history, don't repeat
setopt hist_ignore_dups         # ignore duplicate entries of previous events
setopt hist_ignore_space        # prefix command with a space to skip it's recording
setopt hist_reduce_blanks       # Remove extra blanks from each command added to history
setopt hist_verify              # Don't execute immediately upon history expansion
setopt inc_append_history       # Write to history file immediately, not when shell quits
setopt share_history            # Share history among all sessions

# Tab completion
autoload -Uz compinit && compinit
setopt complete_in_word         # cd /ho/sco/tm<TAB> expands to /home/scott/tmp
setopt auto_menu                # show completion menu on succesive tab presses
setopt autocd                   # cd to a folder just by typing it's name
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&' # These "eat" the auto prior space after a tab complete

# MISC
setopt interactive_comments     # allow # comments in shell; good for copy/paste
unsetopt correct_all            # I don't care for 'suggestions' from ZSH
export BLOCK_SIZE="'1"          # Add commas to file sizes

# PATH
typeset -U path                 # keep duplicates out of the path
path+=(.)                       # append current directory to path (controversial)

# BINDKEY
bindkey -e
bindkey '\e[3~' delete-char
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey ' '  magic-space

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
