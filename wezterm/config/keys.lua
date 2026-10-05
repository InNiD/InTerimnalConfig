local wezterm = require "wezterm"

wezterm.on("update-right-status", function(window, pane)
    local name = window:active_key_table()
    if name == "resize_pane" then
        name = " 󰙖  "
    elseif name == "activate_pane" then
        name = " 󰁁 "
    end
    window:set_right_status(name or '')
end)

local module = {}
function module.apply(config)
    config.disable_default_key_bindings = true
    config.leader = { key = "a", mods = "ALT", timeout_milliseconds = 2000 }
    config.keys = {
        { key = "y", mods = "LEADER", action = wezterm.action.CopyTo "ClipboardAndPrimarySelection", },
        { key = "p", mods = "LEADER", action = wezterm.action.PasteFrom "Clipboard" },
        { key = "u", mods = "LEADER", action = wezterm.action.ScrollByPage(-0.5) },
        { key = "d", mods = "LEADER", action = wezterm.action.ScrollByPage(0.5) },
        { key = "b", mods = "LEADER", action = wezterm.action.ScrollByPage(-1) },
        { key = "f", mods = "LEADER", action = wezterm.action.ScrollByPage(1) },
        { key = "g", mods = "LEADER", action = wezterm.action.ScrollToTop },
        { key = "g", mods = "LEADER|SHIFT", action = wezterm.action.ScrollToBottom },
        { key = "m", mods = "LEADER", action = wezterm.action.Hide },
        { key = "n", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
        { key = "w", mods = "LEADER", action = wezterm.action.CloseCurrentTab({confirm = false}) },
        { key = "l", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1)},
        { key = "h", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1)},
        { key = "\\", mods = "LEADER", action = wezterm.action.SplitHorizontal({domain = "CurrentPaneDomain"}) },
        { key = "-", mods = "LEADER", action = wezterm.action.SplitVertical({domain = "CurrentPaneDomain"}) },
        -- { key = "h", mods = "LEADER|ALT", action = wezterm.action.ActivatePaneDirection("Left") },
        -- { key = "j", mods = "LEADER|ALT", action = wezterm.action.ActivatePaneDirection("Down") },
        -- { key = "k", mods = "LEADER|ALT", action = wezterm.action.ActivatePaneDirection("Up") },
        -- { key = "l", mods = "LEADER|ALT", action = wezterm.action.ActivatePaneDirection("Right") },
        -- { key = "LeftArrow",  mods = "LEADER", action = wezterm.action.AdjustPaneSize({"Left", 5}) },
        -- { key = "DownArrow",  mods = "LEADER", action = wezterm.action.AdjustPaneSize({"Down", 5}) },
        -- { key = "UpArrow",    mods = "LEADER", action = wezterm.action.AdjustPaneSize({"Up", 5}) },
        -- { key = "RightArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({"Right", 5}) },
        { key = "/", mods = "LEADER", action = wezterm.action.Search("CurrentSelectionOrEmptyString") },
        { key = "L", mods = "LEADER", action = wezterm.action.ShowLauncher },
        { key = "c", mods = "LEADER", action = wezterm.action.ClearScrollback("ScrollbackAndViewport") },
        { key = "F1", mods = "LEADER", action = wezterm.action.ShowLauncherArgs {flags = "FUZZY|LAUNCH_MENU_ITEMS|DOMAINS|KEY_ASSIGNMENTS"} },
        {
            key = "r",
            mods = "LEADER",
            action = wezterm.action.ActivateKeyTable {
                name = "resize_pane",
                one_shot = false,
            },
        },
        {
            key = "a",
            mods = "LEADER",
            action = wezterm.action.ActivateKeyTable {
                name = "activate_pane",
                one_shot = false,
            },
        },
    }
    config.key_tables = {
        resize_pane = {
            { key = "h", action = wezterm.action.AdjustPaneSize { "Left", 1 } },
            { key = "l", action = wezterm.action.AdjustPaneSize { "Right", 1 } },
            { key = "k", action = wezterm.action.AdjustPaneSize { "Up", 1 } },
            { key = "j", action = wezterm.action.AdjustPaneSize { "Down", 1 } },

            { key = "c", mods = "CTRL", action = "ClearKeyTableStack" },
        },

        activate_pane = {
            { key = "h", action = wezterm.action.ActivatePaneDirection "Left" },
            { key = "l", action = wezterm.action.ActivatePaneDirection "Right" },
            { key = "k", action = wezterm.action.ActivatePaneDirection "Up" },
            { key = "j", action = wezterm.action.ActivatePaneDirection "Down" },

            { key = "c", mods = "CTRL", action = "ClearKeyTableStack" },
        },
    }
end

return module

