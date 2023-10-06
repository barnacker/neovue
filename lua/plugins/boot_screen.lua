return {


	{
		"goolord/alpha-nvim",
		lazy = true,
		event = "VimEnter",
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
			local head = {
				[[███╗  ██╗███████╗ █████╗ ██╗   ██╗██╗   ██╗███████╗]],
				[[████╗ ██║██╔════╝██╔══██╗██║   ██║██║   ██║██╔════╝]],
				[[██╔██╗██║█████╗  ██║  ██║╚██╗ ██╔╝██║   ██║█████╗]],
				[[██║╚████║██╔══╝  ██║  ██║ ╚████╔╝ ██║   ██║██╔══╝]],
				[[██║ ╚███║███████╗╚█████╔╝  ╚██╔╝  ╚██████╔╝███████╗]],
				[[╚═╝  ╚══╝╚══════╝ ╚════╝    ╚═╝    ╚═════╝ ╚══════╝]],
			}
			dashboard.section.header.val = head
			dashboard.section.buttons.val = {
				dashboard.button("f", " " .. " Find Files", ":Telescope find_files<cr>"),
				dashboard.button("a", " " .. " Add File", ":ene <BAR> startinsert <CR>"),
				dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
				dashboard.button("t", " " .. " Find Text", ":Telescope live_grep <CR>"),
				dashboard.button("s", " " .. " Settings", [[<cmd>PossessionLoad Settings<CR>]]),
				dashboard.button("z", "鈴" .. " Lazy", ":Lazy<CR>"),
				dashboard.button("q", " " .. " Quit", ":qa<CR>"),
				(function()
					local group = { type = "group", opts = { spacing = 0 } }
					group.val = {
						{
							type = "text",
							val = "Sessions",
							opts = {
								position = "center"
							}
						}
					}
					local path = vim.fn.stdpath("data") .. "/possession"
					local files = vim.split(vim.fn.glob(path .. "/*.json"), "\n")
					for i, file in pairs(files) do
						local basename = vim.fs.basename(file):gsub("%.json", "")
						local button = dashboard.button(tostring(i), "勒 " .. basename,
							"<cmd>PossessionLoad " .. basename .. "<cr>")
						table.insert(group.val, button)
					end
					return group
				end)()
			}
			dashboard.opts.layout[1].val = 8
			dashboard.section.header.opts.hl = "Statement"
			dashboard.section.buttons.opts.hl = "String"
			dashboard.section.footer.opts.hl = "Comment"
			return dashboard
		end,
		config = function(_, dashboard)
			require("alpha").setup(dashboard.opts)
		end,
	},
}
