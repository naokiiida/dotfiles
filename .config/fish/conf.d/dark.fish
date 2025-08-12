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
        rm -f $target
        ln -s $source $target
    end
end

function set_helix_theme
    set -l theme $argv[1]
    sed -i '' "s/^theme = \".*\"/theme = \"$theme\"/" /Users/naokiiida/.config/helix/config.toml
    pkill -USR1 hx
end

function set_claude_theme
    set -l theme_value $argv[1]
    claude config set -g theme $theme_value
end

function source_fzf_theme
    set -l theme $argv[1]
    if test $theme = $theme_dark_name
        source /Users/naokiiida/.config/fzf-catppuccin/themes/catppuccin-mocha.fish
    else
        source /Users/naokiiida/.config/fzf-catppuccin/themes/catppuccin-latte.fish
    end
end

function set_fish_theme
    set -l theme $argv[1]
    if test $theme = $theme_dark_name
        fish -c yes | fish_config theme save 'Catppuccin Mocha'
    else
        fish -c yes | fish_config theme save 'Catppuccin Latte'
    end
end

function theme_switch
    set -l STYLE (defaults read NSGlobalDomain AppleInterfaceStyle ^/dev/null)
    if test "$STYLE" = Dark
        echo "$STYLE mode detected."
        set_helix_theme $theme_dark_name
        switch_symlinks $theme_map_dark
        source_fzf_theme $theme_dark_name
        set_fish_theme $theme_dark_name
        set_claude_theme dark
    else
        echo "Light mode detected."
        set_helix_theme $theme_light_name
        switch_symlinks $theme_map_light
        source_fzf_theme $theme_light_name
        set_fish_theme $theme_light_name
        set_claude_theme light
    end
end

# Hammerspoon triggers this by setting unverisal variable
function update_theme --on-variable macOS_Theme
    if test "$macOS_Theme" = Dark
        set_helix_theme $theme_dark_name
        switch_symlinks $theme_map_dark
        source_fzf_theme $theme_dark_name
        set_fish_theme $theme_dark_name
        set_claude_theme dark
    else
        set_helix_theme $theme_light_name
        switch_symlinks $theme_map_light
        source_fzf_theme $theme_light_name
        set_fish_theme $theme_light_name
        set_claude_theme light
    end
end

alias dark=theme_switch
# theme_switch
