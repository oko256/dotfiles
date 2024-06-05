local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

-- Neovim pane navigation integration begins

local function is_inside_vim(pane)
    local tty = pane:get_tty_name()
    if tty == nil then return false end

    local success, stdout, stderr = wezterm.run_child_process
        { 'sh', '-c',
          'ps -o state= -o comm= -t' .. wezterm.shell_quote_arg(tty) .. ' | ' ..
          'grep -iqE \'^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?)(diff)?$\'' }

    return success
end

local function is_outside_vim(pane) return not is_inside_vim(pane) end

local function bind_if(cond, key, mods, action)
    local function callback (win, pane)
        if cond(pane) then
            win:perform_action(action, pane)
        else
            win:perform_action(act.SendKey({key=key, mods=mods}), pane)
        end
    end

    return {key=key, mods=mods, action=wezterm.action_callback(callback)}
end

-- Neovim pane navigation integration ends

config.color_scheme = 'Ayu Dark (Gogh)'
config.colors = {
    foreground = '#d8d8d8',
    background = '#060606',

    cursor_fg = '#000000',
    cursor_bg = '#d8d8d8',
    cursor_border = '#d8d8d8',
}

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 10
config.line_height = 1.1
-- Disable ligatures
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.audible_bell = 'Disabled'

config.scrollback_lines = 10000

config.disable_default_key_bindings = true
config.keys = {
    { key = 'c',            mods = 'CTRL|SHIFT',    action = act.CopyTo 'Clipboard' },
    { key = 'Copy',         mods = 'NONE',          action = act.CopyTo 'Clipboard' },
    { key = 'v',            mods = 'CTRL|SHIFT',    action = act.PasteFrom 'Clipboard' },
    { key = 'Paste',        mods = 'NONE',          action = act.PasteFrom 'Clipboard' },

    { key = 'Insert',       mods = 'CTRL',          action = act.CopyTo 'PrimarySelection' },
    { key = 'Insert',       mods = 'SHIFT',         action = act.PasteFrom 'PrimarySelection' },

    { key = '-',            mods = 'CTRL',          action = act.DecreaseFontSize },
    { key = '+',            mods = 'CTRL',          action = act.IncreaseFontSize },
    { key = '0',            mods = 'CTRL',          action = act.ResetFontSize },

    { key = 'n',            mods = 'CTRL|SHIFT',    action = act.SpawnWindow },
    { key = 't',            mods = 'CTRL|SHIFT',    action = act.SpawnTab 'CurrentPaneDomain' },

    { key = '1',            mods = 'SUPER',         action = act.ActivateTab(0) },
    { key = '2',            mods = 'SUPER',         action = act.ActivateTab(1) },
    { key = '3',            mods = 'SUPER',         action = act.ActivateTab(2) },
    { key = '4',            mods = 'SUPER',         action = act.ActivateTab(3) },
    { key = '5',            mods = 'SUPER',         action = act.ActivateTab(4) },
    { key = '6',            mods = 'SUPER',         action = act.ActivateTab(5) },
    { key = '7',            mods = 'SUPER',         action = act.ActivateTab(6) },
    { key = '8',            mods = 'SUPER',         action = act.ActivateTab(7) },
    { key = '9',            mods = 'SUPER',         action = act.ActivateTab(8) },

    { key = 'Tab',          mods = 'SUPER',         action = act.ActivateTabRelative(1) },
    { key = 'Tab',          mods = 'SUPER|SHIFT',   action = act.ActivateTabRelative(-1) },

    { key = 'PageUp',       mods = 'CTRL|SHIFT',    action = act.MoveTabRelative(1) },
    { key = 'PageDown',     mods = 'CTRL|SHIFT',    action = act.MoveTabRelative(-1) },

    { key = 'PageUp',       mods = 'SHIFT',         action = act.ScrollByPage(-1) },
    { key = 'PageDown',     mods = 'SHIFT',         action = act.ScrollByPage(1) },

    { key = 'u',            mods = 'CTRL|SHIFT',    action = act.CharSelect },

    { key = 'f',            mods = 'CTRL|SHIFT',    action = act.Search 'CurrentSelectionOrEmptyString' },

    { key = 'x',            mods = 'CTRL|SHIFT',    action = act.ActivateCopyMode },
    { key = 'phys:Space',   mods = 'CTRL|SHIFT',    action = act.QuickSelect },

    -- Dash key
    { key = 'raw:61',       mods = 'CTRL|SHIFT',    action = act.SplitVertical{ domain = 'CurrentPaneDomain' } },
    -- Period key
    { key = 'raw:60',       mods = 'CTRL|SHIFT',    action = act.SplitHorizontal{ domain = 'CurrentPaneDomain' } },

    -- Pane movement with neovim integration
    bind_if(is_outside_vim, 'LeftArrow', 'SHIFT', act.ActivatePaneDirection('Left')),
    bind_if(is_outside_vim, 'RightArrow', 'SHIFT', act.ActivatePaneDirection('Right')),
    bind_if(is_outside_vim, 'UpArrow', 'SHIFT', act.ActivatePaneDirection('Up')),
    bind_if(is_outside_vim, 'DownArrow', 'SHIFT', act.ActivatePaneDirection('Down')),

    { key = 'LeftArrow',    mods = 'CTRL|SHIFT|ALT',action = act.AdjustPaneSize{ 'Left', 1 } },
    { key = 'RightArrow',   mods = 'CTRL|SHIFT|ALT',action = act.AdjustPaneSize{ 'Right', 1 } },
    { key = 'UpArrow',      mods = 'CTRL|SHIFT|ALT',action = act.AdjustPaneSize{ 'Up', 1 } },
    { key = 'DownArrow',    mods = 'CTRL|SHIFT|ALT',action = act.AdjustPaneSize{ 'Down', 1 } },

    { key = 'z',            mods = 'CTRL|SHIFT',    action = act.TogglePaneZoomState },
}

config.use_fancy_tab_bar = false

config.initial_rows = 30
config.initial_cols = 120

return config
