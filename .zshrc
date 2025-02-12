export KEYTMEOUT=1
source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

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

y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


# sets the window title using xterm escape codes
function title {
  echo -en "\033]0;$@\a"
}

# wraps helix in a function that sets the title with the args provided to hx
# this is typically the file name/directory
# this does not restore the title after leaving hx
function hx {
  title $@
  command hx $@
}

# runs before every command in zsh and sets the title to the name of the command
# (the hx command overwrites after with its own title call)
preexec() {
  title $1
}

# runs before going back to the prompt in zsh (after a command)
# sets the title to be "zsh" when just at the prompt
precmd () {
  title zsh
}

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
 
theme_switch() {
  local helix_light='catppuccin_latte'
  local helix_dark='dracula'

  local STYLE=$(defaults read NSGlobalDomain AppleInterfaceStyle 2>/dev/null)
  if [[ "$STYLE" == "Dark" ]]; then
    print "$STYLE mode detected."
    sed -i '' "s/^theme = \".*\"/theme = \"$helix_dark\"/" ~/.config/helix/config.toml
  else
    print "Light mode detected."
    sed -i '' "s/^theme = \".*\"/theme = \"$helix_light\"/" ~/.config/helix/config.toml
  fi
  pkill -USR1 hx
}
alias dark=theme_switch
export PATH=$PATH:/Users/naokiiida/.local/bin

alias gsh='gcloud beta interactive'
