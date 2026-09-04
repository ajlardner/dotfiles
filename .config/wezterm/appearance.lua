local M = {}
local wezterm = require('wezterm')
function M.setup(config)
	-- built in monokai color scheme
	config.color_scheme = 'Monokai (base16)'

	config.window_background_opacity = 0.9

	config.font = wezterm.font '0xProto Nerd Font Mono'
	config.font_size = 12
	config.use_fancy_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = true
end
return M
