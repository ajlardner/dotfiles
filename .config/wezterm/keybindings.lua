local M = {}
local wezterm = require('wezterm')
function M.setup(config)
	config.keys = {
		{ key = 'H',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.EmitEvent 'trigger-vim-with-scrollback' }
	}
end

return M
