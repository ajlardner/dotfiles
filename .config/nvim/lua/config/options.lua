---------------------
---- VIM OPTIONS ----
---------------------
-- show absolute line numbers
vim.opt.number = true

-- signs in number column
vim.opt.signcolumn = 'number'

-- default split direction
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showmode = false

-- searching options
vim.opt.incsearch = true
-- searches are only case sensitive if an uppercase letter is entered
vim.opt.ignorecase = true
vim.opt.smartcase = true

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

-- make tabs equal to 4 spaces
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4


-- set line number color to darkgrey and bolded
vim.api.nvim_set_hl(0, 'LineNr', { fg='darkgrey', bold=true })

-- keybind for opening a floating oil window with the parent directory
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })


