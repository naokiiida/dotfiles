if [ -f ~/.profile ]; then
  source ~/.profile
fi

# Sensible, short .zshrc
# Gist page: git.io/vSBRk
# Raw file:  curl -L git.io/sensible-zshrc

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

# PATH
typeset -U path                 # keep duplicates out of the path

#SPACESHIP
#   SPACESHIP_PROMPT_ORDER=(
#     user           # Username section
#     dir            # Current directory section
#     host           # Hostname section
#     git            # Git section (git_branch + git_status + [git_commit](default off))
#     # hg             # Mercurial section (hg_branch  + hg_status)
#     package        # Package version
#     node           # Node.js section
#     bun            # Bun section
#     deno           # Deno section
#     ruby           # Ruby section
#     python         # Python section
#     # red            # Red section
#     # elm            # Elm section
#     # elixir         # Elixir section
#     # xcode          # Xcode section
#     # swift          # Swift section
#     # golang         # Go section
#     # perl           # Perl section
#     # php            # PHP section
#     rust           # Rust section
#     # haskell        # Haskell Stack section
#     # scala          # Scala section
#     # kotlin         # Kotlin section
#     # java           # Java section
#     # lua            # Lua section
#     # dart           # Dart section
#     # julia          # Julia section
#     # crystal        # Crystal section
#     docker         # Docker section
#     docker_compose # Docker section
#     # aws            # Amazon Web Services section
#     gcloud         # Google Cloud Platform section
#     # azure          # Azure section
#     venv           # virtualenv section
#     # conda          # conda virtualenv section
#     uv             # uv virtualenv section
#     # dotnet         # .NET section
#     # ocaml          # OCaml section
#     # vlang          # V section
#     zig            # Zig section
#     # purescript     # PureScript section
#     # erlang         # Erlang section
#     # gleam          # Gleam section
#     # kubectl        # Kubectl context section
#     ansible        # Ansible section
#     # terraform      # Terraform workspace section
#     # pulumi         # Pulumi stack section
#     # ibmcloud       # IBM Cloud section
#     nix_shell      # Nix shell
#     # gnu_screen     # GNU Screen section
#     exec_time      # Execution time
#     async          # Async jobs indicator
#     line_sep       # Line break
#     # battery        # Battery level and status
#     jobs           # Background jobs indicator
#     exit_code      # Exit code section
#     sudo           # Sudo indicator
#     char           # Prompt character
#   )

#   SPACESHIP_RPROMPT_ORDER=(
#     time           # Time stamps section
#   )
# SPACESHIP_GCLOUD_SHOW=false
# SPACESHIP_TIME_SHOW=true
# SPACESHIP_EXIT_CODE_SHOW=true

#brew shell completion
if type /opt/homebrew/bin/brew &>/dev/null
then
  FPATH=/opt/homebrew/share/zsh-completions:$FPATH
  # source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
  # source /opt/homebrew/opt/spaceship/spaceship.zsh
  ZVM_INIT_MODE=sourcing
  source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
  source <(/opt/homebrew/bin/fzf --zsh)
  # eval "$(/opt/homebrew/bin/tailscale completion zsh); compdef _tailscale tailscale;"
  eval "$(/opt/homebrew/bin/rbw gen-completions zsh); compdef _rbw rbw;"
  eval "$(/opt/homebrew/bin/zoxide init zsh)"
  eval "$(/opt/homebrew/bin/uv generate-shell-completion zsh); compdef _uv uv"
fi

# bun completions
[ -s "/Users/naokiiida/.bun/_bun" ] && source "/Users/naokiiida/.bun/_bun"

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

#docker compose
eval "$(/usr/local/bin/docker completion zsh); compdef _docker docker;"
# eval "$(/Users/naokiiida/Library/pnpm/wmill completions zsh); compdef _wmill wmill;"
