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
						toggle_or_jump = '<cr>',
						quit = 'q',
						jump = 'j',
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
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
		},
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true,             -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					}
				},
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
			-- To get fzf loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require('telescope').load_extension('fzf')
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
				current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
					-- delay = 0,
					ignore_whitespace = true,
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
			"nvim-treesitter/nvim-treesitter-textobjects",

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
				},

				textobjects = {
					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
							["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
							["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
							["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

							["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
							["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

							["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
							["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

							["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
							["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

							["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
							["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

							["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
							["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

							["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
						},

					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>sna"] = "@parameter.inner", -- swap parameters/argument with next
							["<leader>snm"] = "@function.outer", -- swap function with next
						},
						swap_previous = {
							["<leader>spa"] = "@parameter.inner", -- swap parameters/argument with prev
							["<leader>spm"] = "@function.outer", -- swap function with previous
						},

					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]f"] = { query = "@call.outer", desc = "Next function call start" },
							["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
							["]c"] = { query = "@class.outer", desc = "Next class start" },
							["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
							["]l"] = { query = "@loop.outer", desc = "Next loop start" },
							["]p"] = { query = "@parameter.inner", desc = "Next parameter start" },

							-- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
							-- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
							["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
							["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
						},
						goto_next_end = {
							["]F"] = { query = "@call.outer", desc = "Next function call end" },
							["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
							["]C"] = { query = "@class.outer", desc = "Next class end" },
							["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
							["]L"] = { query = "@loop.outer", desc = "Next loop end" },
						},
						goto_previous_start = {
							["[f"] = { query = "@call.outer", desc = "Prev function call start" },
							["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
							["[c"] = { query = "@class.outer", desc = "Prev class start" },
							["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
							["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
							["[p"] = { query = "@parameter.inner", desc = "Prev parameter start" },
						},
						goto_previous_end = {
							["[F"] = { query = "@call.outer", desc = "Prev function call end" },
							["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
							["[C"] = { query = "@class.outer", desc = "Prev class end" },
							["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
							["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
						},
					},
				},
			}
			local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

			-- vim way: ; goes to the direction you were moving.
			vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
			vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

			-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
			vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
			vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
			vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
			vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
			vim.cmd ":TSUpdate"
		end
	},
}
