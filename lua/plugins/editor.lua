return {
	{ "tpope/vim-repeat",        event = "VeryLazy" },
	{ "ggandor/lightspeed.nvim", event = "BufReadPost" },
	{ "ojroques/nvim-bufdel",    event = "UIEnter" },
	{ 'akinsho/toggleterm.nvim', version = "*",        opts = { open_mapping = [[<c-t>]] } },
	{
		"folke/neodev.nvim",
		dependencies = "rcarriga/nvim-dap-ui",
		opts = {
			library = { plugins = { "nvim-dap-ui" }, types = true },
		}
	},
	{
		"mbbill/undotree",
		event = "BufReadPost",
		init = function()
			vim.g.undotree_TreeNodeShape   = "◯"
			vim.g.undotree_TreeReturnShape = "─╮"
			vim.g.undotree_TreeVertShape   = "│"
			vim.g.undotree_TreeSplitShape  = "─╯"
		end
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
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
		'nvim-telescope/telescope.nvim',
		event = "UIEnter",
		-- tag = 'master',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				pickers = {
					buffers = {
						mappings = {
							i = { ["<CR>"] = actions.select_tab_drop }
						},
						find_files = {
							mappings = {
								i = { ["<CR>"] = actions.select_tab_drop }
							}
						},
						git_files = {
							mappings = {
								i = { ["<CR>"] = actions.select_tab_drop }
							}
						},
						old_files = {
							mappings = {
								i = { ["<CR>"] = actions.select_tab_drop }
							}
						},
					},
				}
			})
		end
	},
	{
		'lewis6991/gitsigns.nvim',
		lazy = true,
		config = function()
			require('gitsigns').setup {
				signs = {
					add = { text = '│' },
					change = { text = '│' },
					delete = { text = '_' },
					topdelete = { text = '‾' },
					changedelete = { text = '~' },
					untracked = { text = '⧚' },
				},
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					follow_files = true
				},
				attach_to_untracked = true,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
					delay = 500,
					ignore_whitespace = false,
				},
				current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					border = 'single',
					style = 'minimal',
					relative = 'cursor',
					row = 0,
					col = 1
				},
				yadm = {
					enable = false
				},
			}
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			---@diagnostic disable-next-line: missing-fields
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

				indent = { enable = true },

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
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "VeryLazy",
		dependencies = "nvim-treesitter",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require('nvim-treesitter.configs').setup {
				textobjects = {
					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
					}
				},
			}
		end
	},
}
