if status is-interactive
    # Commands to run in interactive sessions can go here
    # fish_vi_key_bindings
end

# bun
fish_add_path "$HOME/.bun/bin"

# uv / pipx
fish_add_path "$HOME/.local/bin"

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
fish_add_path --append $PNPM_HOME

# nix (if installed)
if test -f '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
    source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
end

# gem
fish_add_path "$HOME/.local/share/gem/bin"

# opencode
fish_add_path "$HOME/.opencode/bin"

# fd with hyperlinks
alias fd 'fd --hyperlink=auto'

# eza/exa colors
set -x EXA_COLORS $LS_COLORS
set -x LS_COLORS ''
