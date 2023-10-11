return {
	{
		"jedrzejboczar/possession.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nanozuki/tabby.nvim",
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
					---@diagnostic disable-next-line: unused-local
					before_save = function(name) return {} end,
					---@diagnostic disable-next-line: unused-local
					after_save = function(name, user_data, aborted) end,
					---@diagnostic disable-next-line: unused-local
					before_load = function(name, user_data) return user_data end,
					---@diagnostic disable-next-line: unused-local
					after_load = function(name, user_data) end,
				},
				plugins = {
					close_windows = {
						hooks = { "before_save", 'before_load' },
						preserve_layout = true, -- or fun(win): boolean
						match = {
							floating = true,
							buftype = {},
							filetype = { "undotree", "diff" },
							custom = false, -- or fun(win): boolean
						},
					},
					delete_hidden_buffers = {
						hooks = {
							"before_load",
							vim.o.sessionoptions:match("buffer") and "before_save",
						},
						force = false, -- or fun(buf): boolean
					},
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
}
