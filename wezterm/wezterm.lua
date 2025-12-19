local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- 外观配置
local appears = require 'config.appears'
appears.apply(config)
-- shell 菜单配置
local launch = require 'config.launch'
launch.apply(config)
-- 快捷键配置
local keys = require 'config.keys'
keys.apply(config)
-- 鼠标配置
local mouse = require 'config.mouse'
mouse.apply(config)

-- GPU渲染
-- config.front_end = 'WebGpu'
-- 高性能模式
-- config.webgpu_power_preference = 'HighPerformance'
-- 最大帧率
-- config.max_fps = 165

-- 超链接处理
config.hyperlink_rules = {
    -- 匹配带括号的链接格式 [text](url) 或 {url}
    {regex = '\\[(.*?)\\]\\((https?://[^)]+)\\)', format = '$2'},
    {regex = '\\{(https?://\\S+)\\}', format = '$1'},
    -- 匹配纯URL（排除末尾标点）
    {regex = '\\bhttps?://[^\\s<>"\'`]+[^\\s<>"\'`.,;!?]', format = '$0'}
}

-- 窗口初始化
-- 读取上次窗口打开的位置
-- local position_file_path = wezterm.home_dir .. "/.wezterm_position"
-- local file, err = io.open(position_file_path, "r")
-- if not file then
--     current_screen = ''
-- else
--     current_screen = file:read("*all")
-- end
--
-- 启动监听，初始化窗口
wezterm.on("gui-startup", function(cmd)

    -- 遍历，找到对应的显示器名称
    local screen
    local screens = wezterm.gui.screens().by_name
    for name_tmp, screen_tmp in pairs(screens) do
        if name_tmp == current_screen then
            -- 此处给全局变量 current_screen 赋值了，在“update-status”事件中有用到
            current_screen = name_tmp
            screen = screen_tmp
        end
    end

    -- 如果找不到指定显示器，就取默认值 main
    if screen == nil then
        screen = wezterm.gui.screens().main
    end

    -- 初始化窗口
    local ratio = 0.75
    local width, height = screen.width * ratio, screen.height * ratio
    -- local width, height = 800, 500  --指定窗口宽高，单位 px
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {
        -- width = 50,  -- 这个长宽是行列数，不适合用来计算
        -- height = 30,
        position = {
            x = (screen.width - width) / 2,
            y = (screen.height - height) / 2 * 0.8,  -- 乘以 0.8 让窗口稍微偏上一些更舒适
            origin = {Named=screen.name}
        },
    })
    window:gui_window():set_inner_size(width, height)  -- 这里的长宽单位是 px
end)
--
-- -- 监听状态变化事件，记录窗口位置变化
-- wezterm.on('update-status', function(window, pane)
--     if window:is_focused() then
--         --记录当前窗口所位于的屏幕，下次从这打开
--         -- 一定要用 is_focused 判断，因为 wezterm.gui.screens().active 返回的是拥有焦点的屏幕
--         -- 比如把 wezterm 放在了屏幕 1，鼠标放到了屏幕 2 的 vscode 里，此时 active 的是屏幕 2
--         local active_name = wezterm.gui.screens().active.name
--         if current_screen ~= active_name then
--             local file, err = io.open(position_file_path, "w")
--             file:write(active_name)
--             file:close()
--             current_screen = active_name
--         end
--     end
-- end)

-- 返回配置内容
return config
