local wezterm = require 'wezterm'

local module = {}
function module.apply(config)
    config.mouse_bindings = {
        -- and make CTRL-Click open hyperlinks
        {
            event = { Up = { streak = 1, button = 'Left' } },
            mods = 'CTRL',
            action = wezterm.action.OpenLinkAtMouseCursor
        },
        -- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
        {
            event = { Down = { streak = 1, button = 'Left' } },
            mods = 'CTRL',
            action = wezterm.action.Nop
        },
        -- 左键选择文本并复制到剪贴板
        {
            event = {Up = {streak = 1, button = 'Left'}},
            mods = 'NONE',
            action = wezterm.action.CompleteSelection('Clipboard')
        },
        -- 右键粘贴剪贴板内容
        {
            event = {Down = {streak = 1, button = 'Right'}},
            mods = 'NONE',
            action = wezterm.action.PasteFrom('Clipboard')
        },
        -- 按住 Ctrl+Alt 拖动左键移动窗口
        {
            event = {Drag = {streak = 1, button = 'Left'}},
            mods = 'CTRL|ALT',
            action = wezterm.action.StartWindowDrag
        },
    }
end

return module