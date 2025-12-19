-- Shell 配置
local wezterm = require 'wezterm'

local ps = { label = 'PowerShell', args = { 'C:/Program Files/PowerShell/7/pwsh.exe' } }
local ubuntuwsl = { label = 'Ubuntu-wsl', args = { 'C:/Windows/system32/wsl.exe' ,'-d','Ubuntu' }}
local gitbash = { label = 'git-bash', args = { 'D:/Git/git-bash.exe' }}

local launch_menu = {ps, ubuntuwsl, gitbash}

local module = {}
function module.apply(config)
    -- 默认终端
    config.default_prog = ps.args
    -- shell 菜单列表
    config.launch_menu = launch_menu
end

return module