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
						f = { "<cmd>Telescope find_files<cr>", "Find (f)ile..." },
						t = { "<cmd>Telescope live_grep<cr>", "Find (t)ext in files..." },
						r = { "<cmd>Telescope oldfiles<cr>", "Open (r)ecent File..." },
						a = { "<cmd>enew<cr>", "New File" },
					},
					d = {
						name = "Definition...",
						d = { "<cmd>Lspsaga peek_definition<cr>", "Peek (d)efinition" },
						D = { "<cmd>Lspsaga goto_definition<cr>", "Go to (D)efinition" },
						t = { "<cmd>Lspsaga peek_type_definition<cr>", "Peek (t)ype Definition" },
						T = { "<cmd>Lspsaga goto_type_definition<cr>", "Go to (T)ype Definition" },
					},
					D = { "<cmd>Lspsaga show_workspace_diagnostics ++float<cr>", "Show Local (D)iagnostics..." },
					["H"] = { "<cmd>Lspsaga hover_doc<cr>", "(H)over code" },
					c = {
						name = "Code...",
						f = { "<cmd> Lspsaga finder<cr>", "(f)inder..." },
						a = { "<cmd> Lspsaga code_action<cr>", "(a)ction..." },
						d = { "<cmd>Lspsaga show_buffer_diagnostics ++float<cr>", "Show All (d)iagnostics..." },
					},
				},
				["<f2>"] = { "<cmd>Lspsaga rename<cr>", "Rename Symbol" },
				["<C-,>"] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Previous Diagnostic" },
				["<C-.>"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic" },
				["<A-,>"] = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" },
				["<A-.>"] = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" },
				["<A-x>"] = { "<cmd>BufferDel<cr>", "Close Buffer" },
				["\\"] = { "<cmd>wincmd w<cr>", "Go to Project Pane" },
				["<M-Bslash>"] = { "<cmd>Neotree reveal toggle<cr>", "Toggle Project Pane" },
				[""] = { "<cmd>Lspsaga outline<cr>", "Toggle Outline" },
				[""] = { "<cmd>w<cr>", "Save", mode = { "n", "i" } },
			})
		end,
	}
}
