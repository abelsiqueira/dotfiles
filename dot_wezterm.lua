-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
-- Colors
function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Macchiato"
	else
		return "Catppuccin Latte"
	end
end
local custom_color = wezterm.color.get_builtin_schemes()[scheme_for_appearance(wezterm.gui.get_appearance())]
custom_color.ansi[3] = "#00b050"
custom_color.ansi[5] = "#0050a0"
config.color_schemes = {
	["Custom"] = custom_color,
}
config.color_scheme = "Custom"

config.enable_scroll_bar = true
config.min_scroll_bar_height = "2cell"
-- config.colors = {
--   foreground = "white",
--   background = "black",
--
--   cursor_bg = "orange",
--   cursor_fg = "black",
--   cursor_border = "orange",
--
--   selection_fg = "#ff0",
--   selection_bg = "#05a",
--
--   scrollbar_thumb = "orange",
--
--   split = "orange",
--
--   ansi = {
--     "black",
--     "red",
--     "green",
--     "olive",
--     "navy",
--     "purple",
--     "teal",
--     "silver",
--   },
--   brights = {
--     "grey",
--     "red",
--     "lime",
--     "yellow",
--     "#09f",
--     "fuchsia",
--     "aqua",
--     "white",
--   },
-- }

-- Background
-- config.background = {
--	{
--		source = {
--			File = "/home/abel/Pictures/background.jpg",
--		},
--		repeat_x = "Mirror",
--		repeat_y = "Mirror",
--		hsb = { brightness = 0.01 },
--		attachment = { Parallax = 0.1 },
--	},
--}

-- Font
config.font = wezterm.font_with_fallback({
	"JuliaMono",
	"JetBrains Mono Nerd",
})

config.font_size = 14.0

-- Keys
config.keys = {
	{
		key = "f",
		mods = "SHIFT|CTRL|ALT",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- Window
-- config.window_frame = {
--   border_left_width = "0.0cell",
--   border_left_color = "purple",
-- }
config.window_padding = {
	left = 0,
	right = 0,
	bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
