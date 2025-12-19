local wezterm = require 'wezterm'

local module = {}
function module.apply(config)
    -- Theme
    -- config.color_scheme = 'Catppuccin Frappe'
    -- config.color_scheme = 'Catppuccin Macchiato'
    -- config.color_scheme = 'Catppuccin Mocha'
    -- config.color_scheme = 'Everforest Dark (Gogh)'
    -- config.color_scheme = 'nord'
    -- config.color_scheme = 'Palenight (Gogh)'
    -- config.color_scheme = 'Snazzy'
    -- config.color_scheme = 'tokyonight'
    -- config.color_scheme = 'tokyonight-storm'
    -- config.color_scheme = 'tokyonight_moon'
    -- config.color_scheme = 'tokyonight_storm'
    -- config.color_scheme = 'Gruvbox (Gogh)'
    config.color_scheme = 'Gruvbox Dark (Gogh)'
    -- config.color_scheme = 'Material'
    -- config.color_scheme = 'Material (base16)'
    -- config.color_scheme = 'Material Palenight (base16)'

    -- Sroll bar
    -- config.enable_scroll_bar = true

    -- Font
    config.font = wezterm.font_with_fallback {
        { family = 'Maple Mono Normal NF CN', weight = 'Regular' },
        { family = 'consolaslxgw', weight = 'Regular'  },
    }
    config.font_size = 16

    -- Tab
    config.hide_tab_bar_if_only_one_tab = true
    -- 标签的标题渲染，false 表示使用复古样式
    config.use_fancy_tab_bar = false

    -- Padding
    config.window_padding = {
        left = '1cell',
        right = '0cell',
        top = '0cell',
        bottom = '0cell',
    }

    -- Windows
    -- 窗口标题栏配置。隐藏系统标题栏，将窗口按钮集成到标签栏，允许调整窗口大小。
    config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
    -- 窗口关闭确认，不弹出
    -- config.window_close_confirmation = 'NeverPrompt'
    -- 背景不透明度
    config.window_background_opacity = 0.75
    -- 背景亚克力效果（Windows系统） Acrylic|Mica|Tabbed
    -- config.win32_system_backdrop = 'Acrylic'
end

return module
