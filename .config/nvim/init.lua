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

-- LSPs
vim.lsp.enable('lua_ls')

---------------------
---- VIM OPTIONS ----
---------------------
-- show absolute line numbers
vim.opt.number = true

vim.opt.signcolumn = 'number'

-- remove background colors for normal and nontext on both terminal and gui
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

vim.g.clipboard = {
	name = "wl-clipboard",
	copy  = { ["+"] = "wl-copy", ["*"] = "wl-copy --primary" },                                        paste = { ["+"] = "wl-paste", ["*"] = "wl-paste --primary" },
	cache_enabled = 1,
}
vim.opt.clipboard = "unnamedplus"

-- set line number color to darkgrey and bolded
vim.api.nvim_set_hl(0, 'LineNr', { fg='darkgrey', bold=true })

vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
