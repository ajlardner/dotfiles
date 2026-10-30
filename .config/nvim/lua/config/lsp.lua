-- lsps to enable + their configs
vim.lsp.enable('lua_ls')

vim.lsp.config('biome', {
     root_dir = function(bufnr, on_dir)
       on_dir(vim.fs.root(bufnr, { '.git' }) or vim.fn.getcwd())
    end,
})
vim.lsp.enable('biome')
