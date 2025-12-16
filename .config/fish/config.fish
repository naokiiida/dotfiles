if status is-interactive
    # Commands to run in interactive sessions can go here
    # fish_vi_key_bindings
end

# homebrew configuration (manual setup for faster startup)
fish_add_path --prepend /opt/homebrew/bin /opt/homebrew/sbin
set -gx HOMEBREW_PREFIX /opt/homebrew
set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
set -gx HOMEBREW_REPOSITORY /opt/homebrew
set -gx MANPATH /opt/homebrew/share/man $MANPATH
set -gx INFOPATH /opt/homebrew/share/info $INFOPATH

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# bun
fish_add_path "/Users/naokiiida/Library/Caches/XDG-cache/.bun/bin"

# uv
fish_add_path "/Users/naokiiida/.local/share/../bin"

fish_add_path --append /Users/naokiiida/.lmstudio/bin

# opencode
fish_add_path /Users/naokiiida/.opencode/bin

# pnpm
set -gx PNPM_HOME "/Users/naokiiida/.local/share/pnpm"
fish_add_path --append $PNPM_HOME
# pnpm end

# source (wmill completions fish | psub)
source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'

bind -M insert \cx\ce edit_command_buffer
bind -M default \cx\ce edit_command_buffer
bind -M visual \cx\ce edit_command_buffer

fish_add_path '/Users/naokiiida/.local/DiscordChatExporter.Cli.osx-arm64'
fish_add_path /Users/naokiiida/.local/share/gem/bin

# Added by Antigravity
fish_add_path /Users/naokiiida/.antigravity/antigravity/bin
