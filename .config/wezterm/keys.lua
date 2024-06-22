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
}

return keys
