-- Pull in the wezterm API
local wezterm = require("wezterm")
local vimkeys = require("utils/vimkeys")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Afterglow"
config.font_size = 16
config.font = wezterm.font("Hack Nerd Font", { weight = "Bold", italic = false })
config.window_background_opacity = 0.9

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- splitting
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "|",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "m",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		mods = "LEADER",
		key = "Space",
		action = wezterm.action.RotatePanes("Clockwise"),
	},
	{
		mods = "LEADER",
		key = "0",
		action = wezterm.action.PaneSelect({
			mode = "SwapWithActive",
		}),
	},
	--pane keybindings
	{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
	--tab navigation
	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "LEADER",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "w",
		mods = "LEADER",
		action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	},
	-- move between split panes
	vimkeys.split_nav("move", "h"),
	vimkeys.split_nav("move", "j"),
	vimkeys.split_nav("move", "k"),
	vimkeys.split_nav("move", "l"),
	-- resize panes
	vimkeys.split_nav("resize", "h"),
	vimkeys.split_nav("resize", "j"),
	vimkeys.split_nav("resize", "k"),
	vimkeys.split_nav("resize", "l"),
}
-- and finally, return the configuration to wezterm
return config
