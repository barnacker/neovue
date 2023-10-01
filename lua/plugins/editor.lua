return {
	{ "tpope/vim-repeat" },
	{ "ggandor/lightspeed.nvim" },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup {}
		end
	},
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({
				ui = {
					kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
				},
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
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
}
