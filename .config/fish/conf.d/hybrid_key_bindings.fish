function fish_hybrid_key_bindings --description \
    "Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings fish_hybrid_key_bindings

# Bind C-x C-e like emacs: Ctrl-x then Ctrl-e
# fish sequence: \cx is C-x, \ce is C-e
bind -M insert \cx\ce edit_command_buffer
bind -M default \cx\ce edit_command_buffer
bind -M visual \cx\ce edit_command_buffer

# Bind 'vv' in vi (normal/command) mode to open editor.
# In fish vi-mode, normal/command mode maps are in the 'default' keymap while insert has insert bindings.
# Use 'v v' sequence (space-separated) to represent pressing v twice.
# bind -M normal vv edit_command_buffer
bind -M insert \cg "git diff" repaint
bind -M default vv edit_command_buffer
bind -M visual vv edit_command_buffer
