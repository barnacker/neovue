return {
	{
		'stevearc/dressing.nvim',
		opts = {},
	},
	{
		's1n7ax/nvim-window-picker',
		name = 'window-picker',
		event = 'VeryLazy',
		version = '2.*',
		opts = {
			hint = 'floating-big-letter',
			show_prompt = false,
			highlights = {
				statusline = {
					focused = "Error",
					unfocused = "Error",
				},
				winbar = {
					focused = "Error",
					unfocused = "Error",
				},
			},
		}
	},
	{
		"jedrzejboczar/possession.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim"
		},
		config = function()
			require("telescope").load_extension("possession")
			require("possession").setup {
				-- session_dir = (Path:new(vim.fn.stdpath("data")) / "possession"):absolute(),
				silent = false,
				load_silent = true,
				debug = false,
				logfile = false,
				prompt_no_cr = false,
				autosave = {
					current = true, -- or fun(name): boolean
					tmp = false, -- or fun(): boolean
					tmp_name = 'tmp', -- or fun(): string
					on_load = true,
					on_quit = true,
				},
				commands = {
					save = "PossessionSave",
					load = "PossessionLoad",
					rename = "PossessionRename",
					close = "PossessionClose",
					delete = "PossessionDelete",
					show = "PossessionShow",
					list = "PossessionList",
					migrate = "PossessionMigrate",
				},
				hooks = {
					before_save = function(name) return {} end,
					after_save = function(name, user_data, aborted) end,
					before_load = function(name, user_data) return user_data end,
					after_load = function(name, user_data) end,
				},
				plugins = {
					close_windows = {
						hooks = { "before_save", 'before_load' },
						preserve_layout = true, -- or fun(win): boolean
						match = {
							floating = true,
							buftype = {},
							filetype = {},
							custom = false, -- or fun(win): boolean
						},
					},
					-- delete_hidden_buffers = {
					-- 	hooks = {
					-- 		"before_load",
					-- 		vim.o.sessionoptions:match("buffer") and "before_save",
					-- 	},
					-- 	force = false, -- or fun(buf): boolean
					-- },
					nvim_tree = true,
					neo_tree = false,
					symbols_outline = true,
					tabby = true,
					dap = true,
					dapui = false,
					delete_buffers = false,
				},
				telescope = {
					list = {
						default_action = "load",
						-- mappings = {
						-- 	save = { n = "<c-x>", i = "<c-x>" },
						-- 	load = { n = "<c-v>", i = "<c-v>" },
						-- 	delete = { n = "<c-t>", i = "<c-t>" },
						-- 	rename = { n = "<c-r>", i = "<c-r>" },
						-- },
					},
				},
			}
		end
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true,     -- use a classic bottom cmdline for search
				command_palette = true,   -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false,       -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false,   -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			{
				"rcarriga/nvim-notify",
				opts = {
					background_colour = "#000000",
				}
			},
		}
	}
}
