if status is-interactive
    # Commands to run in interactive sessions can go here
    # fish_vi_key_bindings
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# uv
fish_add_path "/Users/naokiiida/.local/share/../bin"

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/naokiiida/.lmstudio/bin
# End of LM Studio CLI section

# opencode
fish_add_path /Users/naokiiida/.opencode/bin

# pnpm
set -gx PNPM_HOME "/Users/naokiiida/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

source (wmill completions fish | psub)
