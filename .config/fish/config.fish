if status is-interactive
    # Commands to run in interactive sessions can go here
    # fish_vi_key_bindings
    fish_config theme choose catppuccin-mocha
end

# Fish v4 compatibility: user completions take precedence over vendor completions
# This ensures ~/.config/fish/completions/lefthook.fish is used instead of the broken vendor version
set -gx fish_complete_path ~/.config/fish/completions ~/.local/share/fish/vendor_completions.d /opt/homebrew/share/fish/vendor_completions.d

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

fish_add_path '/Users/naokiiida/.local/DiscordChatExporter.Cli.osx-arm64'
fish_add_path /Users/naokiiida/.local/share/gem/bin

# Added by Antigravity
fish_add_path /Users/naokiiida/.antigravity/antigravity/bin

fish_add_path /Users/naokiiida/.config/emacs/bin

fish_add_path /Applications/Obsidian.app/Contents/MacOS

test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

# Added by Antigravity
fish_add_path /Users/naokiiida/.antigravity/antigravity/bin
