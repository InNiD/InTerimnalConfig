local wezterm = require "wezterm"

local module = {}
function module.apply(config)
    -- Background image
    -- config.window_background_image = "D:\\Picture\\IA\\IA10.jpg"
    -- config.window_background_image_hsb = {
    --     brightness = 0.02,
    --     hue = 1.0,
    --     saturation = 1.0,
    -- }

    -- Font
    -- Font Hack "SF Mono" "Dank Mono" "Fantasque Sans Mono" "等距更纱黑体 SC"
    -- "Intel One Mono" "MonacoLigaturized Nerd Font Mono" "Monaco Nerd Font Mono"
    -- Menlo "Ubuntu Mono" "Fira Code" "Maple Mono Normal NF CN" "Source Code Pro"
    -- Ligconsolata Inconsolata Monocraft "JetBrains Mono NL" "JetBrains Mono"
    -- consolaslxgw <-
    config.font = wezterm.font_with_fallback {
        { family = "Maple Mono Normal NF CN", weight = "Regular" },
        { family = "consolaslxgw", weight = "Regular"  },
    }
    config.font_size = 16

    -- Sroll bar
    -- config.enable_scroll_bar = true

    -- Tab
    -- config.hide_tab_bar_if_only_one_tab = true
    config.tab_bar_at_bottom = true
    config.tab_max_width = 22
    -- 标签的标题渲染，false 表示使用复古样式
    config.use_fancy_tab_bar = false

    -- Theme
    config.color_scheme = "Catppuccin Frappe"
    -- config.color_scheme = "Catppuccin Macchiato"
    -- config.color_scheme = "Catppuccin Mocha"
    -- config.color_scheme = "Everforest Dark (Gogh)"
    -- config.color_scheme = "nord"
    -- config.color_scheme = "Palenight (Gogh)"
    -- config.color_scheme = "Snazzy"
    -- config.color_scheme = "tokyonight"
    -- config.color_scheme = "tokyonight-storm"
    -- config.color_scheme = "tokyonight_moon"
    -- config.color_scheme = "tokyonight_storm"
    -- config.color_scheme = "Gruvbox (Gogh)"
    -- config.color_scheme = "Gruvbox Dark (Gogh)"
    -- config.color_scheme = "Material"
    -- config.color_scheme = "Material (base16)"
    -- config.color_scheme = "Material Palenight (base16)"

    -- Windows
    -- Acrylic|Mica|Tabbed
    -- config.win32_system_backdrop = 'Acrylic'
    config.window_background_opacity = 0.82
    -- config.window_close_confirmation = 'NeverPrompt'
    config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

    config.window_frame = {
        border_left_width = "0.45cell",
        border_right_width = "0.45cell",
        border_bottom_height = "0.18cell",
        border_top_height = "0.18cell",
        border_left_color = "#c6d0f5",
        border_right_color = "#c6d0f5",
        border_bottom_color = "#c6d0f5",
        border_top_color = "#c6d0f5",
    }

    config.window_padding = {
        left = "0cell",
        right = "0cell",
        top = "0cell",
        bottom = "0cell",
    }

end

return module

