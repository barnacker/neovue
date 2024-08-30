local rainbowHighlights = {
	'RainbowDelimiterRed',
	'RainbowDelimiterBlue',
	'RainbowDelimiterGreen',
	'RainbowDelimiterOrange',
	'RainbowDelimiterViolet',
	'RainbowDelimiterCyan',
	'RainbowDelimiterYellow',
}
return {
	{
		"rktjmp/lush.nvim",
	},
	{
		dir = "~/.config/nvim/colors/bevangelion",
		dependencies = "rktjmp/lush.nvim",
		config = function()
			vim.cmd('colorscheme bevangelion')
		end
	},
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
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
		"HiPhish/rainbow-delimiters.nvim",
		enabled = true,
		config = function()
			-- This module contains a number of default definitions
			local rainbow_delimiters = require 'rainbow-delimiters'

			vim.g.rainbow_delimiters = {
				strategy = {
					[''] = rainbow_delimiters.strategy['global'],
					vim = rainbow_delimiters.strategy['local'],
				},
				query = {
					[''] = 'rainbow-delimiters',
					lua = 'rainbow-blocks',
				},
				highlight = rainbowHighlights,
			}
		end
	},
	{
		"RRethy/vim-illuminate",
		enabled = true,
		init = function()
			-- default configuration
			require('illuminate').configure({
				-- delay: delay in milliseconds
				delay = 0,
				-- under_cursor: whether or not to illuminate under the cursor
				under_cursor = false,
			})
		end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		config = function()
			local hooks = require "ibl.hooks"
			require("ibl").setup {
				indent = { char = '▏' },
				scope = { highlight = rainbowHighlights },
				exclude = {
					filetypes = {
						"",
						"lspinfo",
						"packer",
						"checkhealth",
						"help",
						"man",
						"gitcommit",
						"TelescopePrompt",
						"TelescopeResults",
						"undotree",
						"diff"
					}
				},
			}

			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end
	},
	{
		"folke/twilight.nvim",
		-- lazy = true,
		opts = {
			-- treesitter = false,
		}
	},
	{
		"folke/zen-mode.nvim",
		-- lazy = true,
		opts = {}
	},
}
