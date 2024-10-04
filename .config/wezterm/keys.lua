local wezterm = require 'wezterm'
local act = wezterm.action

local keys = {
	{ key = "D", mods = "SUPER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "d", mods = "SUPER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "k", mods = "SUPER", action = act.ClearScrollback('ScrollbackAndViewport') },
	{ key = 'LeftArrow', mods = 'SUPER|ALT', action = act.ActivatePaneDirection('Left') },
	{ key = 'RightArrow', mods = 'SUPER|ALT', action = act.ActivatePaneDirection('Right') },
	{ key = 'UpArrow', mods = 'SUPER|ALT', action = act.ActivatePaneDirection('Up') },
	{ key = 'DownArrow', mods = 'SUPER|ALT', action = act.ActivatePaneDirection('Down') },
	{ key = "^", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "_", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "+", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
  -- { key = 'j', mods = 'SUPER', action = wezterm.action.TogglePaneZoomState, },
  {
		key = 'j', mods = 'SUPER',
    action = wezterm.action_callback(function(_, pane)
        local tab = pane:tab()
        local panes = tab:panes_with_info()
        if #panes == 1 then
            pane:split({
                direction = "Right",
                size = 0.4,
            })
        elseif not panes[1].is_zoomed then
            panes[1].pane:activate()
            tab:set_zoomed(true)
        elseif panes[1].is_zoomed then
            tab:set_zoomed(false)
            panes[2].pane:activate()
        end
    end),
	},

}

return keys
