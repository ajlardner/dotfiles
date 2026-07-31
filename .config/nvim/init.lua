require("config.lazy")

-- LSPs
vim.lsp.config('lua_ls', {                                                                          
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { '.luarc.json', '.git' },
})                                                                                                  
vim.lsp.enable('lua_ls')
