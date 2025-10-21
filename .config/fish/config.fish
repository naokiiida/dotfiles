if status is-interactive
    # Commands to run in interactive sessions can go here
    # fish_vi_key_bindings
end

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

source (wmill completions fish | psub)
