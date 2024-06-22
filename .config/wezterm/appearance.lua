local wezterm = require 'wezterm'

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  local helix_light = 'catppuccin_latte'
  local helix_dark = 'dracula'

  if appearance:find 'Dark' then
    io.popen("sed -i '' 's/^theme = \".*\"/theme = \"".. helix_dark.. "\"/' ~/.config/helix/config.toml && pkill -USR1 hx")
    return 'Dracula (Official)'
  else
    io.popen("sed -i '' 's/^theme = \".*\"/theme = \"".. helix_light.. "\"/' ~/.config/helix/config.toml && pkill -USR1 hx")
    return 'catppuccin-latte'
  end
end

return {
  window_decorations = "INTEGRATED_BUTTONS|RESIZE",
  color_scheme = scheme_for_appearance(get_appearance())
}
