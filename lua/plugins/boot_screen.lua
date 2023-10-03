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
						local button = dashboard.button(tostring(i), "勒 " .. basename, "<cmd>PossessionLoad " .. basename .. "<cr>")
						table.insert(group.val, button)
					end
					return group
				end)()
			}
			dashboard.opts.layout[1].val = 8
			return dashboard
		end,
		config = function(_, dashboard)
			require("alpha").setup(dashboard.opts)
		end,
		-- config = function()
		-- 	local query = require('possession.query')
		-- 	local workspaces = {
		-- 		{
		-- 			'Workspace A', -- title
		-- 			'a',      -- shortcuts prefix
		-- 			{
		-- 				'/root/directory/a',
		-- 				'/other/root/directory/',
		-- 			},
		-- 		}, {
		-- 		'Workspace B',
		-- 		'b',
		-- 		'/root/directory/b',
		-- 	}
		-- 	}
		-- 	-- e.g. https://github.com/goolord/alpha-nvim/blob/8a1477d8b99a931530f3cfb70f6805b759bebbf7/lua/alpha/themes/startify.lua#L28
		-- 	local create_button = function(sc, txt, keybind, keybind_opt)
		-- 		-- local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")
		-- 		--
		-- 		-- local opts = {
		-- 		-- 	position = "left",
		-- 		-- 	shortcut = "[" .. sc .. "] ",
		-- 		-- 	cursor = 1,
		-- 		-- 	-- width = 50,
		-- 		-- 	align_shortcut = "left",
		-- 		-- 	hl_shortcut = { { "Operator", 0, 1 }, { "Number", 1, #sc + 1 }, { "Operator", #sc + 1, #sc + 2 } },
		-- 		-- 	shrink_margin = false,
		-- 		-- }
		-- 		-- if keybind then
		-- 		-- 	keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		-- 		-- 	opts.keymap = { "n", sc_, keybind, { noremap = false, silent = true, nowait = true } }
		-- 		-- end
		-- 		--
		-- 		local function on_press()
		-- 			-- local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
		-- 			local key = vim.api.nvim_replace_termcodes(sc .. "<Ignore>", true, false, true)
		-- 			vim.api.nvim_feedkeys(key, "t", false)
		-- 		end
		-- 		--
		-- 		return {
		-- 			type = "button",
		-- 			val = txt,
		-- 			on_press = on_press,
		-- 			-- opts = opts,
		-- 		}
		-- 	end
		--
		-- 	local get_layout = function()
		-- 		return {}
		-- 	end
		--
		-- 	print("Hello Worlrdss")
		-- 	print(vim.inspect(query.alpha_workspace_layout(workspaces, create_button, {
		-- 		others_name = 'Sessions Without Workspace',
		-- 	})))
		-- 	-- use with the rest of sections for alpha.nvim, with throttling to avoid reading files on each redraw
		-- 	local utils = require('possession.utils')
		-- 	local sessions = {
		-- 		type = 'group',
		-- 		val = utils.throttle(get_layout, 5000),
		-- 	}
		--
		--
		-- 	local dashboard = require("alpha.themes.dashboard")
		-- 	-- dashboard.section.header.val = vim.split(logo, "\n")
		-- 	dashboard.section.buttons.val = {
		-- 		dashboard.button("a", "  New file", ":ene <BAR> startinsert <CR>"),
		-- 		dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
		-- 		dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
		-- 		dashboard.button("s", "  Settings", ":cd ~/.config/nvim/<CR> | :e ~/.config/nvim/README.md<CR>"),
		-- 	}
		-- 	dashboard.section.footer.val = " ue IDE for 'Reals' 󰟀 "
		--
		-- 	dashboard.config.opts.noautocmd = true
		--
		-- 	local opts = {
		-- 		layout = {
		-- 			{ type = "padding", val = 2 },
		-- 			head,
		-- 			{ type = "padding", val = 2 },
		-- 			sessions,
		-- 		},
		-- 		opts = {
		-- 			-- noautocmd = true,
		-- 			margin = 5,
		-- 		},
		-- 	}
		--
		--
		-- 	require "alpha".setup(opts)
		--
		-- 	-- vim.cmd [[autocmd User AlphaReady echo 'ready']]
		-- end,
	},
}
