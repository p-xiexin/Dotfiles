local wezterm = require("wezterm")

local config = {
    font_size = 14,
    -- font = wezterm.font("JetBrainsMonoNL Nerd Font Mono", { weight = "Regular" }),
    font = wezterm.font_with_fallback({
        "JetBrainsMonoNL Nerd Font Mono",  -- en
        "Noto Sans CJK SC",                -- zh
    }),
    color_scheme = "OneHalfDark",

    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = false,
    window_decorations = "RESIZE",
    show_new_tab_button_in_tab_bar = false,
    window_background_opacity = 0.75,
    text_background_opacity = 0.9,
    adjust_window_size_when_changing_font_size = false,
    
    window_padding = {
        left = 20,
        right = 20,
        top = 20,
        bottom = 5,
    },
    keys = {
        -- 使用 Alt+左右箭头来切换标签页
        { key = "LeftArrow",  mods = "ALT", action = wezterm.action { ActivateTabRelative = -1 } },
        { key = "RightArrow", mods = "ALT", action = wezterm.action { ActivateTabRelative = 1 } },
        -- 使用 Ctrl+上下箭头拆分标签页
        { key = 'RightArrow',mods = 'CTRL', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        { key = 'DownArrow',mods = 'CTRL', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    },    
}


-- 定义 Alt+数字 切换到对应标签页的快捷键
for i = 1, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'ALT',
        action = wezterm.action.ActivateTab(i - 1),
    })
end

return config