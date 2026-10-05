local wezterm = require "wezterm"
local config = wezterm.config_builder()

local appears = require "config.appears"
appears.apply(config)

local launch = require "config.launch"
launch.apply(config)

local keys = require "config.keys"
keys.apply(config)

local mouse = require "config.mouse"
mouse.apply(config)

config.max_fps = 165

wezterm.on("gui-startup", function(cmd)
    local screen = wezterm.gui.screens().active
    local ratio = 0.8
    local width, height = screen.width * ratio, screen.height * ratio
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {
        position = {
            x = (screen.width - width) / 2,
            y = (screen.height - height) / 2,
            origin = "ActiveScreen"
        }
    })
    window:gui_window():set_inner_size(width, height)
end)

-- wezterm.on('gui-startup', function(cmd)
    -- local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
    -- window:gui_window():maximize()
-- end)

return config

