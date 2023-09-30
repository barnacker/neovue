return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			local wk = require("which-key")
			wk.setup()
			-- As an example, we will create the following mappings:
			--  * <leader>ff find files
			--  * <leader>fr show recent files
			--  * <leader>fb Foobar
			-- we'll document:
			--  * <leader>fn new file
			--  * <leader>fe edit file
			-- and hide <leader>1

			-- wk.register({
			-- 	f = {
			-- 		name = "file",                                                                       -- optional group name
			-- 		f = { "<cmd>Telescope find_files<cr>", "Find File" },                                -- create a binding with label
			-- 		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false, buffer = 123 }, -- additional options for creating the keymap
			-- 		n = { "New File" },                                                                  -- just a label. don't create any mapping
			-- 		e = "Edit File",                                                                     -- same as above
			-- 		["1"] = "which_key_ignore",                                                          -- special label to hide it in the popup
			-- 		b = { function() print("bar") end, "Foobar" }                                        -- you can also pass functions!
			-- 	},
			-- }, { prefix = "<leader>" })
			-- method 2
			wk.register({
				["<leader>"] = {
					f = {
						name = "+file",
						f = { "<cmd>Telescope find_files<cr>", "Find File" },
						r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
						n = { "<cmd>enew<cr>", "New File" },
						b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
					},
				},
			})
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	}
}
