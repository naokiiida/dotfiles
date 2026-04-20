#!/usr/bin/env fish
# Theme file mappings for light and dark modes
set -g theme_light_name catppuccin_latte
set -g theme_dark_name catppuccin_mocha

set -g theme_map_light \
    /Users/naokiiida/.config/gitui/theme.ron=/Users/naokiiida/.config/gitui/catpuccin/themes/catppuccin-latte.ron \
    /Users/naokiiida/.config/yazi/theme.toml=/Users/naokiiida/.config/yazi/catppuccin-yazi/themes/latte/catppuccin-latte-rosewater.toml \
    /Users/naokiiida/.config/nushell/theme.nu=/Users/naokiiida/.config/nushell/nushell-catppuccin/themes/catppuccin_latte.nu

set -g theme_map_dark \
    /Users/naokiiida/.config/gitui/theme.ron=/Users/naokiiida/.config/gitui/catpuccin/themes/catppuccin-mocha.ron \
    /Users/naokiiida/.config/yazi/theme.toml=/Users/naokiiida/.config/yazi/catppuccin-yazi/themes/mocha/catppuccin-mocha-rosewater.toml \
    /Users/naokiiida/.config/nushell/theme.nu=/Users/naokiiida/.config/nushell/nushell-catppuccin/themes/catppuccin_mocha.nu

function switch_symlinks
    set -l theme_map $argv
    for pair in $theme_map
        set -l target (string split "=" $pair)[1]
        set -l source (string split "=" $pair)[2]
        # rm -f $target && ln -s $source $target
        if test -e $source
            test -e $target
            ln -sfn $source $target 2>/dev/null
        else
            echo "symlink theme map files doesn't exist. source:[" $source "] target:[" $target "]"
        end
    end
end

function set_glow_yazi_theme
    set -l theme $argv[1]
    set -l filepath /Users/naokiiida/.config/yazi/yazi.toml
    sed -i '' -E "s/(glow -w=\\\$w -s=)[a-z]+/\1$theme/" $filepath
end

function set_mpls_theme
    set -l theme (string replace '_' '-' $argv[1])
    sed -i '' -E "s/(--theme\",? \")catppuccin-[a-z]+/\1$theme/g; s/(--code-style\",? \")catppuccin-[a-z]+/\1$theme/g" /Users/naokiiida/.config/helix/languages.toml
end

function set_helix_theme
    set -l theme $argv[1]
    sed -i '' "s/^theme = \".*\"/theme = \"$theme\"/" /Users/naokiiida/.config/helix/config.toml
    pkill -USR1 hx
end

function set_nvim_theme
    set -l theme $argv[1]
    # Find all running NeoVim server sockets under $TMPDIR/nvim.{user}/
    for sock in (command find $TMPDIR -maxdepth 2 -name 'nvim.*' -type s 2>/dev/null)
        nvim --server $sock --remote-send ":CatppuccinSet $theme<CR>" 2>/dev/null
    end
end

function set_claude_theme
    set -l theme_value $argv[1]
    set -l config_file ~/.claude.json

    if test $theme_value = light
        # Set theme to "light" in config
        if test -f $config_file
            cat $config_file | jq '.theme = "light"' | sponge $config_file
        else
            echo '{"theme": "light"}' | jq . >$config_file
        end
    else
        # Remove theme property for dark mode
        if test -f $config_file
            cat $config_file | jq 'del(.theme)' | sponge $config_file
        end
    end
end

function set_gemini_theme
    set -l theme_value $argv[1]
    set -l config_file ~/.gemini/settings.json

    if test $theme_value = light
        # Set theme to "ANSI Light" in config
        if test -f $config_file
            cat $config_file | jq '.ui.theme = "ANSI Light"' | sponge $config_file
        else
            echo '{"ui": {"theme": "ANSI Light"}}' | jq . >$config_file
        end
    else if test $theme_value = dark
        # Set theme to "ANSI" in config
        if test -f $config_file
            cat $config_file | jq '.ui.theme = "ANSI"' | sponge $config_file
        else
            echo '{"ui": {"theme": "ANSI"}}' | jq . >$config_file
        end
    else
        echo "Usage: set_gemini_theme [light|dark]"
        return 1
    end
end

function source_fzf_theme
    set -l theme $argv[1]
    if test $theme = $theme_dark_name
        source /Users/naokiiida/.config/fzf-catppuccin/themes/catppuccin-mocha.fish
    else
        source /Users/naokiiida/.config/fzf-catppuccin/themes/catppuccin-latte.fish
    end
end

function _apply_theme --argument-names mode
    if test $mode = dark
        set -l cat_name $theme_dark_name
        set_helix_theme $cat_name
        set_mpls_theme $cat_name
        set_nvim_theme $cat_name
        switch_symlinks $theme_map_dark
        source_fzf_theme $cat_name
        set_claude_theme dark
        set_gemini_theme dark
        set_glow_yazi_theme dark
    else
        set -l cat_name $theme_light_name
        set_helix_theme $cat_name
        set_mpls_theme $cat_name
        set_nvim_theme $cat_name
        switch_symlinks $theme_map_light
        source_fzf_theme $cat_name
        set_claude_theme light
        set_gemini_theme light
        set_glow_yazi_theme light
    end
end

function _on_color_theme_change --on-variable fish_terminal_color_theme
    if test "$fish_terminal_color_theme" = light
        _apply_theme light
    else
        _apply_theme dark
    end
end

# Hammerspoon triggers this by setting universal variable
function _on_macos_theme_change --on-variable macOS_Theme
    if test "$macOS_Theme" = Dark
        _apply_theme dark
    else
        _apply_theme light
    end
end
