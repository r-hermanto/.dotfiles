local wezterm = require 'wezterm'
local mux = wezterm.mux

local config = {}

wezterm.on('gui-startup', function(cmd)
    print("run here")
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

config.color_scheme = 'rose-pine-moon'
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.audible_bell = 'Disabled'
config.warn_about_missing_glyphs = false

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 13

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

return config
