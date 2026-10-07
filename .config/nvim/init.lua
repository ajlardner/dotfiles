------------------------
---- PLUGIN CONFIGS ----
------------------------
-- lazy.nvim keeps plugins updated and installed, per plugin config is in the files required below
require 'config.lazy'
require 'config.colors'
require 'config.lualine'
require 'config.commands'
require 'config.oil'
require 'config.colorizer'
require 'config.options'
require('autoclose').setup()
-- LSPs
vim.lsp.enable('lua_ls')

