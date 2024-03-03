--- pull in the wezterm API
local wezterm = require 'wezterm'

--- initialise the configs
local config = wezterm.config_builder()

--- colour scheme
config.color_scheme = 'Gruvbox Dark (Gogh)'

--- font
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 11

--- return the config
return config
