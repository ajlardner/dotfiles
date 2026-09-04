-- returns a table where each entry is a table representing a plugin
-- used by lazy.nvim for installing and updating plugins
-- imported in lazy.nvim setup in ~/.config/nvim/lua/config/lazy.lua
return {
	{ 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }},
	{ 'neovim/nvim-lspconfig' },
	{ 'MeanderingProgrammer/render-markdown.nvim', 
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, 
    		---@module 'render-markdown'
    		---@type render.md.UserConfig
		opts = {},
	},
	{ 'norcalli/nvim-colorizer.lua' },
	{ 'nvim-telescope/telescope.nvim', version = '*',
    		dependencies = {
        		'nvim-lua/plenary.nvim',
        		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    		}
	},
	{ 'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
	},

}
