local wezterm = require 'wezterm'

-- <https://github.com/wez/wezterm/issues/4429#issuecomment-1774827062>
wezterm.on('toggle-colorscheme', function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.color_scheme then
		overrides.color_scheme = 'Default (dark) (terminal.sexy)'
		overrides.window_background_opacity = 1.0
	else
		overrides.color_scheme = nil
		overrides.window_background_opacity = 0.8
	end
	window:set_config_overrides(overrides)
end)

local config = {
	window_decorations = "NONE",

	hide_tab_bar_if_only_one_tab = true,

	color_scheme = 'Nord (base16)',

	window_background_opacity = 0.5,

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
	}}
}

return config
