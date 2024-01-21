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
  if appearance:find 'Dark' then
    return 'Mocha (dark) (terminal.sexy)'
  else
    return 'Mocha (light) (terminal.sexy)'
  end
end

return {
  window_decorations = "INTEGRATED_BUTTONS|RESIZE",
  color_scheme = scheme_for_appearance(get_appearance())
}
