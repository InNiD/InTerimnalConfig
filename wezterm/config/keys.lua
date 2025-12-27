local wezterm = require 'wezterm'

local module = {}
function module.apply(config)
    config.leader = {key = "a", mods = "CTRL", timeout_milliseconds = 2000}
    config.keys = {
        -- Ctrl+Shift+N 新窗口
        -- { key = 'N', mods = 'SHIFT|CTRL', action = wezterm.action.SpawnWindow },
        { key = 'y', mods = 'LEADER', action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection', },
        { key = 'p', mods = 'LEADER', action = wezterm.action.PasteFrom 'Clipboard' },
        { key = 'u', mods = 'LEADER', action = wezterm.action.ScrollByPage(-0.5) },
        { key = 'd', mods = 'LEADER', action = wezterm.action.ScrollByPage(0.5) },
        { key = 'g', mods = 'LEADER', action = wezterm.action.ScrollToTop },
        { key = 'g', mods = 'LEADER|SHIFT', action = wezterm.action.ScrollToBottom },
        -- Leader + F11 全屏
        {key = 'Enter', mods = 'LEADER', action = wezterm.action.ToggleFullScreen},
        -- Leader + m:隐藏窗口
        {key = 'm', mods = 'LEADER', action = wezterm.action.Hide},
        -- Leader + n:新建标签页
        {key = 'n', mods = 'LEADER', action = wezterm.action.SpawnTab('CurrentPaneDomain')},
        -- Leader + w:关闭当前标签页(不确认)
        {key = 'w', mods = 'LEADER', action = wezterm.action.CloseCurrentTab({confirm = false})},
        -- Leader + Tab:切换到下一个标签页
        {key = 'l', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1)},
        -- Leader + Shift + Tab:切换到上一个标签页
        {key = 'h', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(-1)},
        -- Leader + \\:水平分割
        {key = '\\', mods = 'LEADER', action = wezterm.action.SplitHorizontal({domain = 'CurrentPaneDomain'})},
        -- Leader + -:垂直分割
        {key = '-', mods = 'LEADER', action = wezterm.action.SplitVertical({domain = 'CurrentPaneDomain'})},
        -- Leader + 方向键:在窗格之间移动
        {key = "LeftArrow", mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Left')},
        {key = "DownArrow", mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Down')},
        {key = "UpArrow", mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Up')},
        {key = "RightArrow", mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Right')},
        -- Ctrl + Shift + 方向键:调整窗格大小
        {key = "LeftArrow",  mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize({'Left', 5})},
        {key = "DownArrow",  mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize({'Down', 5})},
        {key = "UpArrow",    mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize({'Up', 5})},
        {key = "RightArrow", mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize({'Right', 5})},
        -- Leader + f:搜索
        {key = 'f', mods = 'LEADER', action = wezterm.action.Search('CurrentSelectionOrEmptyString')},
        -- Leader + ::打开 Launcher
        {key = ':', mods = 'LEADER', action = wezterm.action.ShowLauncher},
        -- Leader + c:清除滚动缓冲区
        {key = 'c', mods = 'LEADER', action = wezterm.action.ClearScrollback('ScrollbackAndViewport')},
        -- F1:帮助 / 命令面板
        {key = "F1", mods = 'LEADER', action = wezterm.action.ShowLauncherArgs {
            flags = "FUZZY|LAUNCH_MENU_ITEMS|DOMAINS|KEY_ASSIGNMENTS"
        }},
    }
end

return module
