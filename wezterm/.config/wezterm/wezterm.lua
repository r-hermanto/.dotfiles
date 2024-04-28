local wezterm = require 'wezterm'
local mux = wezterm.mux

local config = {}

wezterm.on('gui-startup', function(cmd)
    print("run here")
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

config.color_scheme = 'tokyonight_night'
config.window_decorations = "RESIZE"
config.enable_tab_bar = false

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 13

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

return config
