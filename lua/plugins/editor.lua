return {
	{
		"mbbill/undotree"
	},
	{ "ojroques/nvim-bufdel",    event = "UIEnter" },
	{
		'nvim-telescope/telescope.nvim',
		event = "UIEnter",
		tag = '0.1.3',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
		'numToStr/Comment.nvim',
		event = "BufReadPost",
		opts = {
			toggler = {
				---Line-comment toggle keymap
				line = '<C-/>',
				---Block-comment toggle keymap
				block = 'gbc',
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
				line = '<C-/>',
				---Block-comment keymap
				block = 'gb',
			},
			---LHS of extra mappings
			extra = {
				---Add comment on the line above
				above = 'gcO',
				---Add comment on the line below
				below = 'gco',
				---Add comment at the end of line
				eol = 'gcA',
			},
		},
	},
	{
		"yamatsum/nvim-cursorline",
		opts = {
			cursorline = {
				enable = true,
				timeout = 100,
				number = false,
			},
			cursorword = {
				enable = false,
				min_length = 3,
				hl = { underline = true },
			}
		}
	},
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({
				-- ui = {
				-- 	kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
				-- },
				lightbulb = {
					enable = false
				},
				outline = {
					close_after_jump = true,
					keys = {
						toggle_or_jump = 'l',
						quit = 'q',
						jump = 'h',
					},
				},
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons"   -- optional
		}
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},
	{ "tpope/vim-repeat",        event = "VeryLazy" },
	{ "ggandor/lightspeed.nvim", event = "BufReadPost" },
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			require 'nvim-treesitter.configs'.setup {
				-- A list of parser names, or "all" (the five listed parsers should always be installed)
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "yaml", "bash", "regex",
					"markdown_inline", "javascript", "typescript", "html", "css", "scss", "vue" },

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				-- List of parsers to ignore installing (or "all")
				-- ignore_install = { "javascript" },

				---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
				-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = '<cr>', -- set to `false` to disable one of the mappings
						scope_incremental = false,
						node_incremental = "<cr>",
						node_decremental = "<S-cr>",
					},
				},

				highlight = { enable = true },

				indent = {
					enable = false
				},

				autotag = {
					enable = true,
					enable_rename = true,
					enable_close = true,
					enable_close_on_slash = true,
				}
			}
			vim.cmd ":TSUpdate"
		end
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
}
