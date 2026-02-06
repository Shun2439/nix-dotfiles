local wezterm = require 'wezterm'
local act = wezterm.action

-- <https://github.com/wez/wezterm/issues/4429#issuecomment-1774827062>
wezterm.on('toggle-colorscheme', function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.color_scheme then
		overrides.color_scheme = 'Default (dark) (terminal.sexy)'
		overrides.window_background_opacity = 1.0
	else
		overrides.color_scheme = nil
		overrides.window_background_opacity = 0.7
	end
	window:set_config_overrides(overrides)
end)

local config = {
	window_decorations = "NONE",

	hide_tab_bar_if_only_one_tab = true,

	color_scheme = 'Catppuccin Mocha',

	window_background_opacity = 0.7,

	-- 使うフォントを指定する
	-- font = wezterm.font 'Moralerspace Radon HWNF',

	-- weztermの起動時に呼び出すシェルを指定する
	-- default_prog = {'cmd.exe'},

	keys = {{
		key = 't',
		mods = 'SHIFT|ALT',
		action = wezterm.action({
			EmitEvent = "toggle-colorscheme"
		})
	}, {
        key = 'h', -- Home
        mods = 'ALT',
        action = act.SwitchToWorkspace {
            name = 'default'
        }
    }, -- Create a new workspace with a random name and switch to it
    {
        key = 'n',
        mods = 'ALT',
        action = act.SwitchToWorkspace
    }, -- Show the launcher in fuzzy selection mode and have it list all workspaces
    -- and allow activating one.
    {
        key = 'f', -- find
        mods = 'ALT',
        action = act.ShowLauncherArgs {
            flags = 'FUZZY|WORKSPACES'
        }
    }, {
        key = 'F',
        mods = 'ALT|SHIFT',
        action = wezterm.action.ShowTabNavigator
    }, {
        key = 'J',
        mods = 'ALT|SHIFT',
        action = act.SwitchWorkspaceRelative(1)
    }, {
        key = 'K',
        mods = 'ALT|SHIFT',
        action = act.SwitchWorkspaceRelative(-1)
    },}
}

return config
