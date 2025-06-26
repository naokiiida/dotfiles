local utils = require 'utils'
-- Pull in the wezterm API
local wezterm = require 'wezterm'
local appearance = require 'appearance'
local key_bindings = require 'keys'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 1
config.keys = key_bindings
-- config.font = wezterm.font 'HackGen35 Console NF'
config.font = wezterm.font 'UDEV Gothic 35NFLG'
-- config.use_ime = false

config.ssh_domains = {
  {
    -- This name identifies the domain
    name = 'nixos',
    -- The hostname or address to connect to. Will be used to match settings
    -- from your ssh config file
    remote_address = '192.168.64.8',
    -- The username to use on the remote host
    username = 'naokiiida',
  },
  {
    -- This name identifies the domain
    name = 'fmva77hr',
    -- The hostname or address to connect to. Will be used to match settings
    -- from your ssh config file
    remote_address = 'fmva77hr',
    -- The username to use on the remote host
    -- username = 'niida',
  },
  {
    -- This name identifies the domain
    -- name = 'd4',
    name = 'digitalocean',
    -- The hostname or address to connect to. Will be used to match settings
    -- from your ssh config file
    -- remote_address = '167.71.208.131',
    remote_address = 'digitalocean',
    -- The username to use on the remote host
    -- username = 'digital',
  },
}

-- and finally, return the configuration to wezterm
return utils.merge({appearance, config})
