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
					q = { "<cmd>qa!<cr>", "quit all" },
					["<cr>"] = { "i<cr><esc>", "new line" },
					f = {
						name = "find...",
						f = { "<cmd>Telescope find_files<cr>", "file..." },
						t = { "<cmd>Telescope live_grep<cr>", "text in files..." },
						r = { "<cmd>Telescope oldfiles<cr>", "recent file..." },
						s = { "<cmd>Telescope possession list<cr>", "session..." },
					},
					a = { "<cmd>enew<cr>", "add file" },
					d = { "<cmd>Lspsaga show_buf_diagnostics ++float<cr>", "diagnostics (Buffer)..." },
					D = { "<cmd>Lspsaga show_workspace_diagnostics ++float<cr>", "Diagnostics (Workspace)..." },
					h = { "<cmd>Lspsaga hover_doc<cr>", "hover code..." },
					c = {
						name = "code...",
						f = { "<cmd> Lspsaga finder<cr>", "find..." },
						a = { "<cmd> Lspsaga code_action<cr>", "action..." },
					},
					p = {
						name = "peek...",
						d = { "<cmd>Lspsaga peek_definition<cr>", "definition" },
						t = { "<cmd>Lspsaga peek_type_definition<cr>", "type definition" },
					},
					j = {
						name = "jump to...",
						d = { "<cmd>Lspsaga goto_definition<cr>", "definition" },
						t = { "<cmd>Lspsaga goto_type_definition<cr>", "type definition" },
					},
				},
				["<f2>"] = { "<cmd>Lspsaga rename<cr>", "Rename Symbol" },
				["<C-,>"] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Previous Diagnostic" },
				["<C-.>"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic" },
				["<A-,>"] = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" },
				["<A-.>"] = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" },
				["<A-x>"] = { "<cmd>BufDel<cr>", "Close Buffer" },
				["\\"] = { "<cmd>wincmd w<cr>", "Go to Project Pane" },
				["<M-Bslash>"] = { "<cmd>Neotree reveal toggle<cr>", "Toggle Project Pane" },
				[""] = { "<cmd>Lspsaga outline<cr>", "Toggle Outline" },
				[""] = { "<cmd>w<cr><esc>", "Save", mode = { "n", "i" } },
				["<A-h>"] = { "<C-w>h", "Left Window" },
				["<A-l>"] = { "<C-w>l", "Right Window" },
				["<A-j>"] = { "<C-w>j", "Down Window" },
				["<A-k>"] = { "<C-w>k", "Up Window" },
			})
		end,
	}
}
