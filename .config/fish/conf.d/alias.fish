# show hidden files
alias l.='ls -d .*'
# all files with / at the end of directories
alias la='ls -aF'
# make the dir command work kinda like in windows (long format) with human readable size values
alias dir='ls -hl'
# make grep highlight results using color
alias grep='grep --color=auto'
# keka archiver
alias brotli='keka brotli'
alias kwet='keka kwet'
alias lrzip='keka lrzip'
alias lz4='keka lz4'
alias lzip='keka lzip'
alias pbzip2='keka pbzip2'
alias pigz='keka pigz'
alias plzip='keka plzip'
alias snzip='keka snzip'
alias tar='keka tar'
alias unar='keka unar'
alias unrar='keka unrar'
alias xz='keka xz'
alias zstd='keka zstd'

# custom directories
alias 42="cd '/Users/naokiiida/Documents/42/42cursus'"
alias work="cd '/Users/naokiiida/Documents/2_work'"
alias gb="cd '/Users/naokiiida/Documents/1_personal/housemaker-catalogue/genbaou-docker'"
alias vault="cd /Users/naokiiida/Documents/Vault"
alias d1="cd /Users/naokiiida/Documents/1_personal"
alias d4="cd /Users/naokiiida/Documents/4_clone"
alias dyt="cd /Users/naokiiida/Movies/yt-dlp"

alias gsh='gcloud beta interactive'
alias gam="/Users/naokiiida/bin/gam7/gam"

alias adb='HOME="$XDG_DATA_HOME"/android command adb'

# Task Master aliases added on 6/24/2025
alias tm='task-master'
alias taskmaster='task-master'
alias gf='gas-fakes --env ~/.config/gas-fakes/.env'

# tmux + SSH aliases
alias tsyi='ssh -t syi "tmux attach -t main 2>/dev/null || tmux new -s main"'
alias ta='tmux attach -t'
alias tl='tmux list-sessions'
alias tn='tmux new -s'
alias tk='tmux kill-session -t'

alias cm='cmux claude-teams --allow-dangerously-skip-permissions'
