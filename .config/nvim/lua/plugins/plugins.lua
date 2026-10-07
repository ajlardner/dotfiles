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
	{ 'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		lazy = false,
	},
	{ 'ibhagwan/fzf-lua',
          -- optional for icon support
          dependencies = { 'nvim-tree/nvim-web-devicons' },
          ---@module 'fzf-lua'
          ---@type fzf-lua.Config|{}
          ---@diagnostic disable: missing-fields
          opts = {}
          ---@diagnostic enable: missing-fields
	},
    { 'saghen/blink.cmp',
          dependencies = {
            'saghen/blink.lib',
            -- optional: provides snippets for the snippet source
            'rafamadriz/friendly-snippets',
          },
          build = function()
            -- build the fuzzy matcher, optionally add a timeout to `pwait(timeout_ms)`
            -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
            require('blink.cmp').build():pwait()
          end,

          ---@module 'blink.cmp'
          ---@type blink.cmp.Config
          opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = 'default' },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = false } },

            -- (Default) list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"`
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "lua" }
          },
    },
    { 'm4xshen/autoclose.nvim' } 
}
