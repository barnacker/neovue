return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			local focus_pane = function()
				if vim.bo.filetype == "NvimTree" then
					vim.cmd("wincmd l")
					return
				end
				vim.cmd("NvimTreeFindFile")
			end
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
					t = {
						name = "tabs...",
						a = { "<cmd>$tabnew<cr>", "add new tab" },
						x = { "<cmd>tabclose<cr>", "close this tab" },
						o = { "<cmd>tabonly<cr>", "close all other tabs" },
					},
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
				["<A-,>"] = { "<cmd>tabp<cr>", "Previous Tab" },
				["<A-.>"] = { "<cmd>tabn<cr>", "Next Tab" },
				["<C-A-,>"] = { "<cmd>-tabmove<cr>", "Move Tab Back" }, -- move current tab to previous position
				["<C-A-.>"] = { "<cmd>+tabmove<cr>", "Move Tab Forward" }, -- move current tab to next position
				["<A-x>"] = { "<cmd>tabclose<cr>", "Close Tab" },
				["\\"] = { focus_pane, "Go to Project Pane" },
				["<M-Bslash>"] = { "<cmd>NvimTreeToggle<cr>", "Toggle Project Pane" },
				[""] = { "<cmd>Lspsaga outline<cr>", "Toggle Outline" },
				[""] = { "<cmd>w<cr><esc>", "Save", mode = { "n", "i" } },
				["<A-h>"] = { "<C-w>h", "Left Window" },
				["<A-l>"] = { "<C-w>l", "Right Window" },
				["<A-j>"] = { "<C-w>j", "Down Window" },
				["<A-k>"] = { "<C-w>k", "Up Window" },
				["<esc>"] = { "<cmd>noh<cr>", "Clear Search" },
				["<F9>"] = { "<cmd>DapContinue<cr>", "Continue" },
				["<C-F8>"] = { "<cmd>DapToggleBreakpoint<cr>", "Toggle Breakpoint" },
				["<F8>"] = { "<cmd>DapStepOver<cr>", "Step Over" },
				["<F7>"] = { "<cmd>DapStepInto<cr>", "Step Into" },
				["<S-F8>"] = { "<cmd>DapStepOut<cr>", "Step Out" },
				["<C-F2>"] = { "<cmd>DapTerminate<cr>", "Terminate" },
			})
		end,
	}
}
