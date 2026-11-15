local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- General
config.color_scheme = "Catppuccin Mocha"
config.line_height = 1.3
config.font_size = 13
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular"})

-- Tab bar
config.enable_tab_bar = false

config.colors ={
  cursor_bg = "#7aa2f7",
  cursor_border = "#7aa2f7",
}

return config
