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
			wk.setup({
				opts = {
					operators = true,
					text_objects = true,
					motions = true
				}
			})
			wk.register({
				["<leader>"] = {
					f = {
						name = "File...",
						f = { "<cmd>Telescope find_files<cr>", "Find File..." },
						r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File..." },
						a = { "<cmd>enew<cr>", "New File" },
					},
					d = {
						name = "Definition...",
						d = { "<cmd>Lspsaga peek_definition<cr>", "Peek Definition" },
						D = { "<cmd>Lspsaga goto_definition<cr>", "Go To Definition" },
						t = { "<cmd>Lspsaga peek_type_definition<cr>", "Peek Type Definition" },
						T = { "<cmd>Lspsaga goto_type_definition<cr>", "Go To Type Definition" },
					},
					D = { "<cmd>Lspsaga show_workspace_diagnostics ++float<cr>", "Show Diagnostics..." },
					["H"] = { "<cmd>Lspsaga hover_doc<cr>", "Hover code" },
					c = {
						name = "Code...",
						f = { "<cmd> Lspsaga finder<cr>", "Finder..." },
						a = { "<cmd> Lspsaga code_action<cr>", "Action..." },
					},
				},
				["<f2>"] = { "<cmd>Lspsaga rename<cr>", "Rename Symbol" },
				["<C-.>"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic" },
				["<C-,>"] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Previous Diagnostic" },
				["<C-.>"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic" },
				["<A-,>"] = { "<cmd>BufferLineCyclePrev<cr>", "Previous Diagnostic" },
				["<A-.>"] = { "<cmd>BufferLineCycleNext<cr>", "Next Diagnostic" },
				["\\"] = { "<cmd>wincmd w<cr>", "Go to Project Pane" },
				["<M-Bslash>"] = { "<cmd>Neotree reveal toggle<cr>", "Toggle Project Pane" },
				[""] = { "<cmd>Lspsaga outline<cr>", "Toggle Outline" },
				[""] = { "<cmd>w<cr>", "Save" },
			})
		end,
	}
}
