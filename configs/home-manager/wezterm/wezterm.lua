local wezterm = require('wezterm')
local mux = wezterm.mux
local act = wezterm.action

-- local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
-- local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

-- local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_pixelated_squares_big_mirrored
-- local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_pixelated_squares_big

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_left_half_circle_thick
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_right_half_circle_thick

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then
    return title
  end

  return tab_info.active_pane.title
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local background = "#1e1e2e" -- Base
  local foreground = "#cdd6f4" -- Text
  local edge_background = "none"

  if tab.is_active then
    background = "#b4befe" -- Lavender
    foreground = "#1e1e2e"
  end

  local edge_foreground = background

  local title = "   " .. wezterm.truncate_right(tab_title(tab), max_width - 1) .. "   "
  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

-- <https://github.com/wez/wezterm/issues/4429#issuecomment-1774827062>
wezterm.on('toggle-colorscheme', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.color_scheme then
    -- 課題用
    overrides.color_scheme = 'Default (dark) (terminal.sexy)'
    overrides.window_background_opacity = 1.0
    overrides.window_background_image_hsb = {
      brightness = 0.0
    }
  else
    overrides.color_scheme = nil
    overrides.window_background_opacity = 0.75
    overrides.window_background_image_hsb = {
      brightness = 1.0
    }
  end
  window:set_config_overrides(overrides)
end)

local config = {
  automatically_reload_config = true,

  -- windowの枠を消す
  -- window_decorations = "RESIZE",
  window_decorations = "NONE",

  -- <https://github.com/ryoppippi/dotfiles/blob/main/wezterm/tab_bar.lua>
  -- タブバーの非表示
  hide_tab_bar_if_only_one_tab = true,

  -- 新規タブの`+`を非表示
  show_new_tab_button_in_tab_bar = false,

  -- どちらがいいか悩む
  -- use_fancy_tab_bar = false,

  -- タブバーの透過
  -- only for MacOS?
  window_frame = {
    inactive_titlebar_bg = "none",
    active_titlebar_bg = "none",
  },

  -- タブバーを背景色に合わせる
  window_background_gradient = {
    colors = {"#000000"}
  },

  window_padding = {
    left = 1,
    right = 0,
    top = 0,
    bottom = 0
  },

  -- color_scheme = 'Nord (base16)',
  color_scheme = 'Catppuccin Mocha',
  -- color_scheme = 'Halloween Pumpkin',
  colors = {
    tab_bar = {
      -- background = "none",
      inactive_tab_edge = "none",
    },
  },

  -- for 10/31
  color_schemes = {
    ['Halloween Pumpkin'] = {
      background = '#1a0d00',
      foreground = '#e0a050',

      ansi = {'#220d00', '#d35400', '#7f8c8d', '#f39c12', '#6a5acd', '#8e44ad', '#bbbbbb', '#ecf0f1'},
      brights = {'#555555', '#e74c3c', '#5d8f6d', '#f1c40f', '#8458b3', '#9b59b6', '#a9d5e7', '#ffffff'},

      selection_bg = '#a0522d',
      selection_fg = '#ffffff',

      cursor_bg = '#d35400',
      cursor_fg = '#1a0d00',
      cursor_border = '#d35400',

      tab_bar = {
        background = '#280f00',
        active_tab = {
          bg_color = '#d35400',
          fg_color = '#1a0d00',
          intensity = 'Normal'
        },
        inactive_tab = {
          bg_color = '#331a00',
          fg_color = '#888888'
        },
        new_tab = {
          bg_color = '#280f00',
          fg_color = '#888888'
        }
      }
    }
  },

  -- <https://wezterm.org/config/appearance.html#window-background-image>
  -- window_background_image = 'Z:\\stock\\screen_shots\\GY.png',

  window_background_opacity = 0.75,

  -- 使うフォントを指定する
  font = wezterm.font 'Moralerspace Radon HW',

  keys = {{
    key = '!',
    mods = 'CTRL|SHIFT',
    action = wezterm.action({
      EmitEvent = "SpawnNewTabOnCmd"
    })
  }, {
      key = '"',
      mods = 'CTRL|SHIFT',
      action = wezterm.action({
        EmitEvent = "SpawnNewTabOnPwsh"
      })
    }, {
      key = '#',
      mods = 'CTRL|SHIFT',
      action = wezterm.action({
        EmitEvent = "SpawnNewTabOnWsl"
      })
    }, {
      key = 'T',
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
      key = '9',
      mods = 'ALT',
      action = act.ShowLauncherArgs {
        flags = 'FUZZY|WORKSPACES'
      }
    }, {
      key = ')',
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
    }},

  -- ssh_domains = {{
  --     -- This name identifies the domain
  --     name = 'my.server',
  --     -- The hostname or address to connect to. Will be used to match settings
  --     -- from your ssh config file
  --     remote_address = '192.168.1.1',
  --     -- The username to use on the remote host
  --     username = 'shun'
  -- }}
}

-- activate tab
-- wrong?
-- for i = 1, 9 do
--   table.insert(keys, {
--     key = tostring(i),
--     mods = "CTRL",
--     action = wezterm.action.ActivateTab(i - 1),
--   })
-- end

return config
