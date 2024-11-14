local wezterm = require 'wezterm'
local config = {}

config.automatically_reload_config = true
config.enable_tab_bar = false
config.font_size = 14.0
config.font = wezterm.font('JetBrains Mono')
-- config.window_background_opacity = 0.78

config.window_decorations = 'RESIZE'
config.native_macos_fullscreen_mode = true
config.background = {
	{
		source = {Color="black"}
	}
}

config.keys = {
	{
		key = 'f',
		mods = 'CTRL',
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = '\'',
		mods = 'CTRL',
		action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
	},
}
config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'CTRL',
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}
config.window_close_confirmation = "NeverPrompt"

-- transparent window

-- function set_background(window)
-- 	local window_dims = window:get_dimensions()
-- 	local overrides = window:get_config_overrides() or {}
--
-- 	if window_dims.is_full_screen then
-- 		overrides.background = {
-- 			{
-- 				source = {
-- 					File = "/Users/flavioreber/Pictures/desktop_background.jpg",
-- 				},
-- 				vertical_offset = "-31%"
-- 			},
-- 			{
-- 				source = {
-- 					Color = "#1a2133",
-- 				},
-- 				width = "100%",
-- 				height = "100%",
-- 				opacity = 0.78,
-- 			},
--
-- 		}
-- 	else
-- 		overrides.background = nil
-- 		overrides.window_background_opacity = 0.78
-- 	end
-- 	window:set_config_overrides(overrides)
-- end
--
-- wezterm.on('window-resized', function(window, _)
--   set_background(window)
-- end)
--
-- wezterm.on('window-config-reloaded', function(window)
--   set_background(window)
-- end)

return config
