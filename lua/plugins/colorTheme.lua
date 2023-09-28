return {
	{
		"xiyaowong/nvim-transparent",
		opts = {
      extra_groups = { -- table/string: additional groups that should be cleared
    		"BufferLineTabClose",
    		"BufferlineBufferSelected",
    		"BufferLineFill",
    		"BufferLineBackground",
    		"BufferLineSeparator",
    		"BufferLineIndicatorSelected",

    		"IndentBlanklineChar",

    		-- make floating windows transparent
    		"LspFloatWinNormal",
    		"Normal",
    		"NormalFloat",
    		"FloatBorder",
    		"TelescopeNormal",
    		"TelescopeBorder",
    		"TelescopePromptBorder",
    		"SagaBorder",
    		"SagaNormal",
			},
		}
	},
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
					cmp = true,
					neotree = true,
					rainbow_delimiters = true,
					illuminate = {
				    enabled = true,
				    lsp = false
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
        transparent_background = true,
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
	{
		"RRethy/vim-illuminate",
		init = function ()
			-- default configuration
		require('illuminate').configure({
		    -- providers: provider used to get references in the buffer, ordered by priority
		    providers = {
		        'lsp',
		        'treesitter',
		        'regex',
		    },
		    -- delay: delay in milliseconds
		    delay = 100,
		    -- filetype_overrides: filetype specific overrides.
		    -- The keys are strings to represent the filetype while the values are tables that
		    -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
		    filetype_overrides = {},
		    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
		    filetypes_denylist = {
		        'dirbuf',
		        'dirvish',
		        'fugitive',
		    },
		    -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
		    -- You must set filetypes_denylist = {} to override the defaults to allow filetypes_allowlist to take effect
		    filetypes_allowlist = {},
		    -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
		    -- See `:help mode()` for possible values
		    modes_denylist = {},
		    -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
		    -- See `:help mode()` for possible values
		    modes_allowlist = {},
		    -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
		    -- Only applies to the 'regex' provider
		    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
		    providers_regex_syntax_denylist = {},
		    -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
		    -- Only applies to the 'regex' provider
		    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
		    providers_regex_syntax_allowlist = {},
		    -- under_cursor: whether or not to illuminate under the cursor
		    under_cursor = true,
		    -- large_file_cutoff: number of lines at which to use large_file_config
		    -- The `under_cursor` option is disabled when this cutoff is hit
		    large_file_cutoff = nil,
		    -- large_file_config: config to use for large files (based on large_file_cutoff).
		    -- Supports the same keys passed to .configure
		    -- If nil, vim-illuminate will be disabled for large files.
		    large_file_overrides = nil,
		    -- min_count_to_highlight: minimum number of matches required to perform highlighting
		    min_count_to_highlight = 1,
		    -- should_enable: a callback that overrides all other settings to
		    -- enable/disable illumination. This will be called a lot so don't do
		    -- anything expensive in it.
		    should_enable = function(bufnr) return true end,
		    -- case_insensitive_regex: sets regex case sensitivity
		    case_insensitive_regex = false,
		})
		end
	},
}
