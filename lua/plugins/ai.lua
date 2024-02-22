return {
	-- { "github/copilot.vim" }
	{
		"zbirenbaum/copilot.lua",
		event = "BufReadPost",
		config = function()
			require('copilot').setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>"
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						-- accept = "<M-l>",
						accept = false,
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = false,
					},
				},
				filetypes = {
					yaml = false,
					markdown = true,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = 'node', -- Node.js version must be > 16.x
				server_opts_overrides = {},
			})
		end
	},
	-- {
		-- "dreamsofcode-io/chatgpt.nvim",
		-- "jackMort/ChatGPT.nvim",
		-- commit = "d4aa4d9e31d620a0c01006e59f4449ffc7eb33ce",
		-- event = "VeryLazy",
		-- config = function()
			-- require("chatgpt").setup({
				-- api_key_cmd = "cat /run/secrets/chatgptapi"
			-- })
		-- end,
		-- dependencies = {
			-- "MunifTanjim/nui.nvim",
			-- "nvim-lua/plenary.nvim",
			-- "nvim-telescope/telescope.nvim"
		-- }
	-- }
}
