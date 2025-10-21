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

function set_glow_yazi_theme
    set -l theme $argv[1]
    set filepath /Users/naokiiida/.config/yazi/yazi.toml
    set regex '(run\s*=\s*'\''piper -- CLICOLOR_FORCE=1 glow -w=\$w -s=)\w+'
    set replaced (cat $filepath | string replace -r $regex "\$1$theme")
    printf "%s\n" $replaced >$filepath
end

function set_helix_theme
    set -l theme $argv[1]
    sed -i '' "s/^theme = \".*\"/theme = \"$theme\"/" /Users/naokiiida/.config/helix/config.toml
    pkill -USR1 hx
end

function set_claude_theme
    set -l theme_value $argv[1]
    set -l config_file ~/.claude.json

    if test $theme_value = "light"
        # Set theme to "light" in config
        if test -f $config_file
            cat $config_file | jq '.theme = "light"' > $config_file.tmp && mv $config_file.tmp $config_file
        else
            echo '{"theme": "light"}' | jq . > $config_file
        end
    else
        # Remove theme property for dark mode
        if test -f $config_file
            cat $config_file | jq 'del(.theme)' > $config_file.tmp && mv $config_file.tmp $config_file
        end
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

function set_fish_theme
    set -l theme $argv[1]
    if test $theme = $theme_dark_name
        fish -c yes | fish_config theme save 'Catppuccin Mocha'
    else
        fish -c yes | fish_config theme save 'Catppuccin Latte'
    end
end

function theme_switch
    set -l STYLE (defaults read NSGlobalDomain AppleInterfaceStyle 2>/dev/null)
    if test "$STYLE" = Dark
        echo "$STYLE mode detected."
        set_helix_theme $theme_dark_name
        switch_symlinks $theme_map_dark
        source_fzf_theme $theme_dark_name
        set_fish_theme $theme_dark_name
        set_claude_theme dark
        set_glow_yazi_theme dark
    else
        echo "Light mode detected."
        set_helix_theme $theme_light_name
        switch_symlinks $theme_map_light
        source_fzf_theme $theme_light_name
        set_fish_theme $theme_light_name
        set_claude_theme light
        set_glow_yazi_theme light
    end
end

# Hammerspoon triggers this by setting unverisal variable
function update_theme --on-variable macOS_Theme
    "hammerspoon macos theme change triggered"
    if test "$macOS_Theme" = Dark
        set_helix_theme $theme_dark_name
        switch_symlinks $theme_map_dark
        source_fzf_theme $theme_dark_name
        set_fish_theme $theme_dark_name
        set_claude_theme dark
        set_glow_yazi_theme dark
    else
        set_helix_theme $theme_light_name
        switch_symlinks $theme_map_light
        source_fzf_theme $theme_light_name
        set_fish_theme $theme_light_name
        set_claude_theme light
        set_glow_yazi_theme light
    end
end

alias dark=theme_switch
# theme_switch
