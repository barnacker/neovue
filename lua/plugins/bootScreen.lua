return {
	{
		"goolord/alpha-nvim",
		lazy = true,
		event = "VimEnter",
		config = function()
			require "alpha".setup(require "alpha.themes.dashboard".config)
			local dashboard = require("alpha.themes.dashboard")
			local logo = [[

███╗  ██╗███████╗ █████╗ ██╗   ██╗██╗   ██╗███████╗
████╗ ██║██╔════╝██╔══██╗██║   ██║██║   ██║██╔════╝
██╔██╗██║█████╗  ██║  ██║╚██╗ ██╔╝██║   ██║█████╗
██║╚████║██╔══╝  ██║  ██║ ╚████╔╝ ██║   ██║██╔══╝
██║ ╚███║███████╗╚█████╔╝  ╚██╔╝  ╚██████╔╝███████╗
╚═╝  ╚══╝╚══════╝ ╚════╝    ╚═╝    ╚═════╝ ╚══════╝
]]

			dashboard.section.header.val = vim.split(logo, "\n")
			dashboard.section.buttons.val = {
				dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
				dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
				dashboard.button("s", "  Settings", ":cd ~/.config/nvim/<CR> | :e ~/.config/nvim/README.md<CR>"),
			}
			dashboard.section.footer.val = " ue IDE for 'Reals' 󰟀 "

			dashboard.config.opts.noautocmd = true

			vim.cmd [[autocmd User AlphaReady echo 'ready']]
		end,
	},
}
