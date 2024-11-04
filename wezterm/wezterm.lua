local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- config.color_scheme = "Nightfox"
config.color_scheme = "carbonfox"
config.default_prog = { "wsl", "--distribution", "ubuntu", "--cd", "~" }

-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
	{
		key = "a",
		mods = "LEADER|CTRL",
		action = act.SendKey({ key = "a", mods = "CTRL" }),
	},
	-- Reload config
	{ key = "R", mods = "LEADER", action = act.ReloadConfiguration, },
	-- Split window
	{
		key = "v",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "s",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection "Left" },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection "Right" },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection "Up" },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection "Down" },
	{ key = "q", mods = "LEADER", action = act.CloseCurrentPane { confirm = true }},
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain")},
}

config.key_tables = {
	-- Defines the keys that are active in our resize-pane mode.
	-- Since we're likely to want to make multiple adjustments,
	-- we made the activation one_shot=false. We therefore need
	-- to define a key assignment for getting out of this mode.
	-- 'resize_pane' here corresponds to the name="resize_pane" in
	-- the key assignments above.
	resize_pane = {
		{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
		-- Cancel the mode by pressing escape
		-- { key = "Escape", action = "PopKeyTable" },
		{ key = "Escape", action = "ClearKeyTableStack" },
	},
}

return config
