local utils = require 'utils'
-- Pull in the wezterm API
local wezterm = require 'wezterm'
local appearance = require 'appearance'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
config.window_background_opacity = 1
local act = wezterm.action
config.keys = {
	{ key = "d", mods = "SUPER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "D", mods = "SUPER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
}

-- and finally, return the configuration to wezterm
return utils.merge({appearance, config})
