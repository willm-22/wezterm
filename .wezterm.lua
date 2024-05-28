local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
local config = {} 

config.color_scheme = 'Catppuccin Macchiato'

config.font_rules = {
    {
        intensity = "Half",
        italic = false,
        font = wezterm.font("JetBrains Mono", { weight = "Light", stretch = "Normal", style = "Normal" }),
    },
    {
        intensity = "Half",
        italic = true,
        font = wezterm.font("JetBrains Mono", { weight = "Light", stretch = "Normal", style = "Italic" }),
    },
}

config.font_size = 10

config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_rate = 0

config.default_prog = { 'powershell' }

config.use_fancy_tab_bar = false

-- Show which key table is active in the status area
wezterm.on('update-right-status', function(window, pane)
    local name = window:active_key_table()
    if name then
      name = 'TABLE: ' .. name
    end
    window:set_right_status(name or '')
end)

config.leader = { key = 'a', mods = 'CTRL' }

config.keys = {
    {
        key = 'r',
        mods = 'LEADER',
        action = act.ActivateKeyTable {
            name= 'resize_pane',
            one_shot = false,
        },
    },

    {
        key = 'a',
        mods = 'LEADER',
        action = act.ActivateKeyTable {
            name = 'activate_pane',
            one_shot = false,
        },
    },

    {
        key = 't',
        mods = 'LEADER',
        action = act.ShowTabNavigator,
    },

    {
        key = 'v',
        mods = 'LEADER',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
    },

    {
        key = 'd',
        mods = 'LEADER',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },

    {
        key = 'Space',
        mods = 'LEADER',
        action = wezterm.action.RotatePanes 'Clockwise'
    },

    {
        key = 'x',
        mods = 'LEADER',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
}

config.key_tables = {
    resize_pane = {
        { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 1 } },
        { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },

        { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
        { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },

        { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 1 } },
        { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },

        { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 1 } },
        { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },

        -- Cancel the mode by pressing escape
        { key = 'Escape', action = 'PopKeyTable' },
      },
      activate_pane = {
        { key = 'LeftArrow', action = act.ActivatePaneDirection 'Left' },
        { key = 'h', action = act.ActivatePaneDirection 'Left' },

        { key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
        { key = 'l', action = act.ActivatePaneDirection 'Right' },

        { key = 'UpArrow', action = act.ActivatePaneDirection 'Up' },
        { key = 'k', action = act.ActivatePaneDirection 'Up' },

        { key = 'DownArrow', action = act.ActivatePaneDirection 'Down' },
        { key = 'j', action = act.ActivatePaneDirection 'Down' },
        { key = 'Escape', action = 'PopKeyTable' },
      },
}

config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'

config.tab_max_width = 32
config.tab_bar_style = {
    window_close = wezterm.format {
        { Background = { Color = '#24273a'} },
        { Foreground = { Color = '#ed8796'} },
        { Text = " " .. wezterm.nerdfonts.cod_circle_large_filled .. " " },
    },
    window_close_hover = wezterm.format {
        { Background = { Color = '#ed8796'} },
        { Foreground = { Color = '#24273a'} },
        { Text = " " .. wezterm.nerdfonts.cod_circle_large_filled .. " " },
    },
    window_maximize = wezterm.format {
        { Background = { Color = '#24273a'} },
        { Foreground = { Color = '#eed49f'} },
        { Text = wezterm.nerdfonts.cod_chrome_maximize },
    },
    window_maximize_hover = wezterm.format {
        { Background = { Color = '#eed49f'} },
        { Foreground = { Color = '#24273a'} },
        { Text = wezterm.nerdfonts.cod_chrome_maximize },
    },
    window_hide = wezterm.format {
        { Background = { Color = '#24273a'} },
        { Foreground = { Color = '#a6da95'} },
        { Text = " " .. wezterm.nerdfonts.cod_circle_large_filled .. " " },
    },
    window_hide_hover = wezterm.format {
        { Background = { Color = '#a6da95'} },
        { Foreground = { Color = '#24273a'} },
        { Text = " " .. wezterm.nerdfonts.cod_circle_large_filled .. " " },
    },
}

config.colors = {
    tab_bar = {
        background = '#24273a',
        active_tab = {
            bg_color = '#363a4f',
            fg_color = '#b7bdf8',
            intensity = 'Bold',
            italic = true,
        },
        inactive_tab = {
            bg_color = '#24273a',
            fg_color = '#b7bdf8',
        },
        inactive_tab_hover = {
            bg_color = '#24273a',
            fg_color = '#8aadf4',
        },
        new_tab = {
            bg_color = '#24273a',
            fg_color = '#b7bdf8',
        },
        new_tab_hover = {
            bg_color = '#b7bdf8',
            fg_color = '#24273a',
        }
    }
}
config.integrated_title_buttons = {'Hide', 'Close'}

return config
