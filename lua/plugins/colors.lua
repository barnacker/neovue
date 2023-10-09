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
		"leafOfTree/vim-vue-plugin",
		enabled = false
	},

	{
		"posva/vim-vue",
		enabled = true
	},
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
		"catppuccin/nvim",
		priority = 1000,
		lazy = false,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				integrations = {
					alpha = true,
					gitsigns = true,
					treesitter = true,
					semantic_tokens = true,
					lsp_saga = true,
					cmp = true,
					notifier = true,
					neotree = true,
					markdown = true,
					rainbow_delimiters = true,
					lightspeed = true,
					---@diagnostic disable-next-line: assign-type-mismatch
					illuminate = {
						enabled = true,
						lsp = false
					},
					indent_blankline = {
						enabled = true,
						scope_color = "mauve", -- catppuccin color (eg. `lavender`) Default: text
						colored_indent_levels = false,
					},
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
						inlay_hints = {
							background = true,
						},
					},
				},
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					loops = { "bold" },
					functions = { "bold" },
					keywords = { "bold" },
					strings = {},
					variables = {},
					numbers = { "bold" },
					booleans = { "bold" },
					properties = {},
					types = { "bold" },
					operators = {},
				},
				transparent_background = false,
				show_end_of_buffer = false,
				-- custom_highlights = function(colors)
				-- 	return {
				-- 		NormalFloat = { bg = colors.crust },
				-- 		FloatBorder = { bg = colors.crust, fg = colors.crust },
				-- 		VertSplit = { bg = colors.base, fg = colors.surface0 },
				-- 		CursorLineNr = { fg = colors.mauve, style = { "bold" } },
				-- 		Pmenu = { bg = colors.crust, fg = "" },
				-- 		PmenuSel = { bg = colors.surface0, fg = "" },
				-- 		TelescopeSelection = { bg = colors.surface0 },
				-- 		TelescopePromptCounter = { fg = colors.mauve, style = { "bold" } },
				-- 		TelescopePromptPrefix = { bg = colors.surface0 },
				-- 		TelescopePromptNormal = { bg = colors.surface0 },
				-- 		TelescopeResultsNormal = { bg = colors.mantle },
				-- 		TelescopePreviewNormal = { bg = colors.crust },
				-- 		TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
				-- 		TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
				-- 		TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
				-- 		TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
				-- 		TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
				-- 		TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
				-- 		GitSignsChange = { fg = colors.peach },
				-- 		NvimTreeIndentMarker = { link = "IndentBlanklineChar" },
				-- 		NvimTreeExecFile = { fg = colors.text },
				-- 	}
				-- end,
			})
			-- vim.cmd('colorscheme catppuccin')
		end,
	},
	{
		"folke/twilight.nvim",
		lazy = true,
		opts = {}
	},
	{
		"folke/zen-mode.nvim",
		lazy = true,
		opts = {}
	},
}
