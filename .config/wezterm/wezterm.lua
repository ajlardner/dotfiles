local config = require('wezterm').config_builder()

require('keybindings').setup(config)
require('appearance').setup(config)
require('functions')

return config
