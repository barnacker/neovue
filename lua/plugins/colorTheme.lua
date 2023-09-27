return {
	  {
    "catppuccin/nvim",
    priority = 1000;
    lazy = false,
    name = "catppuccin",
    -- you can do it like this with a config function
    config = function()
      require("catppuccin").setup({
        integrations = {
          gitsigns = true,
          treesitter = true,
					coc_nvim = true,
					cmp = true,
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
        custom_highlights = function(colors)
          return {
            NormalFloat = { bg = colors.crust },
            FloatBorder = { bg = colors.crust, fg = colors.crust },
            VertSplit = { bg = colors.base, fg = colors.surface0 },
            CursorLineNr = { fg = colors.mauve, style = { "bold" } },
            Pmenu = { bg = colors.crust, fg = "" },
            PmenuSel = { bg = colors.surface0, fg = "" },
            TelescopeSelection = { bg = colors.surface0 },
            TelescopePromptCounter = { fg = colors.mauve, style = { "bold" } },
            TelescopePromptPrefix = { bg = colors.surface0 },
            TelescopePromptNormal = { bg = colors.surface0 },
            TelescopeResultsNormal = { bg = colors.mantle },
            TelescopePreviewNormal = { bg = colors.crust },
            TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
            TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
            TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
            TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
            TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
            TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
            IndentBlanklineChar = { fg = colors.surface0 },
            IndentBlanklineContextChar = { fg = colors.surface2 },
            GitSignsChange = { fg = colors.peach },
            NvimTreeIndentMarker = { link = "IndentBlanklineChar" },
            NvimTreeExecFile = { fg = colors.text },
          }
        end,
      })
      vim.cmd('colorscheme catppuccin')
    end,
  },
	{
		"HiPhish/rainbow-delimiters.nvim",
		config=function()
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
			    highlight = {
			        'RainbowDelimiterRed',
			        'RainbowDelimiterYellow',
			        'RainbowDelimiterBlue',
			        'RainbowDelimiterOrange',
			        'RainbowDelimiterGreen',
			        'RainbowDelimiterViolet',
			        'RainbowDelimiterCyan',
			    },
			}
		end
	},
}
