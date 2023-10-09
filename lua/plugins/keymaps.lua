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
					local api = require "nvim-tree.api"
					api.node.open.edit()
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
				},
				icons = {
					-- breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
					-- separator = "➜", -- symbol used between a key and it's label
					group = "󰮫 ", -- symbol prepended to a group
				},
				key_labels = {
					-- override the label used to display some keys. It doesn't effect WK in any other way.
					-- For example:
					-- ["<space>"] = "SPC",
					["<CR>"] = "󰌑 ",
					["<leader>"] = "<space>",
					-- ["<tab>"] = "TAB",
				},
			})
			wk.register({
				["<leader>"] = {
					name = "󰶆 leader menu...",
					["<leader>"] = { "<cmd>Telescope find_files<cr>", "  find files" },
					["?"] = { "<cmd>WhichKey<cr>", "Show All Mappings" },
					q = { "<cmd>qa!<cr>", "  quit all" },
					["<cr>"] = { "i<cr><esc>", "new line" },
					b = {
						name = "breakpoints...",
						c = { "<cmd>DapContinue<cr>", "Continue <F9>" },
						b = { "<cmd>DapToggleBreakpoint<cr>", "Toggle Breakpoint <Ctrl-F8>" },
						o = { "<cmd>DapStepOver<cr>", "Step Over <F8>" },
						i = { "<cmd>DapStepInto<cr>", "Step Into <F7>" },
						t = { "<cmd>DapStepOut<cr>", "Step Out <Shift-F8>" },
						x = { "<cmd>DapTerminate<cr>", "Terminate <Ctrl-F2>" },
						l = { "<cmd>Telescope dap list_breakpoints<cr>", "list" },
					},
					t = {
						name = "tabs...",
						n = { "<cmd>$tabnew<cr>", "new tab" },
						x = { "<cmd>tabclose<cr>", "close this tab" },
						o = { "<cmd>tabonly<cr>", "close all other tabs" },
					},
					f = {
						name = "find...",
						f = { "<cmd>Telescope find_files<cr>", "file" },
						t = { "<cmd>Telescope live_grep<cr>", "text in files" },
						r = { "<cmd>Telescope oldfiles<cr>", "recent file" },
						s = { "<cmd>Telescope possession list<cr>", "session" },
						n = { "<cmd>Telescope notify<cr>", "notification" },
						d = { "<cmd>Telescope diagnostics<cr>", "diagnostics" },
					},
					a = { "<cmd>enew<cr>", "  add file" },
					z = { "<cmd>Lazy<cr>", "鈴 lazy plugins" },
					d = { "<cmd>Lspsaga show_buf_diagnostics ++float<cr>", "diagnostics (Buffer)" },
					D = { "<cmd>Lspsaga show_workspace_diagnostics ++float<cr>", "Diagnostics (Workspace)" },
					h = { "<cmd>Lspsaga hover_doc<cr>", "hover code" },
					c = {
						name = "code...",
						f = { "<cmd> Lspsaga finder<cr>", "find" },
						a = { "<cmd> Lspsaga code_action<cr>", "action" },
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
				["<F5>"] = { "<cmd>UndotreeToggle<cr>", "Local History" },
				["<C-.>"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic" },
				["<C-n>"] = { "<cmd>$tabnew<cr>", "New tab" },
				["<A-,>"] = { "<cmd>tabp<cr>", "Previous Tab" },
				["<A-.>"] = { "<cmd>tabn<cr>", "Next Tab" },
				["<C-A-,>"] = { "<cmd>-tabmove<cr>", "Move Tab Back" }, -- move current tab to previous position
				["<C-A-.>"] = { "<cmd>+tabmove<cr>", "Move Tab Forward" }, -- move current tab to next position
				["<A-w>"] = { "<cmd>tabclose<cr>", "Close Tab" },
				["\\"] = { focus_pane, "Go to Project Pane" },
				["<M-Bslash>"] = { "<cmd>NvimTreeToggle<cr>", "Toggle Project Pane" },
				[""] = { "<cmd>Lspsaga outline<cr>", "Toggle Outline" },
				[""] = { "<cmd>w<cr><esc>", "Save", mode = { "n", "i" } },
				["<A-h>"] = { "<C-w>h", "Left Window" },
				["<A-l>"] = { "<C-w>l", "Right Window" },
				["<A-j>"] = { "<C-w>j", "Down Window" },
				["<A-k>"] = { "<C-w>k", "Up Window" },
				["<C-h>"] = { "<C-w><", "Decrease Window Width" },
				["<C-l>"] = { "<C-w>>", "Increase Window Width" },
				["<C-j>"] = { "<C-w>-", "Decrease Window Height" },
				["<C-k>"] = { "<C-w>+", "Increase Window Height" },
				["<C-=>"] = { "<C-w>=", "Equalize Windows Sizes" },
				["<A-x>"] = { "<C-w>q", "Close Window" },
				["<esc>"] = { "<cmd>noh<cr>", "Clear Search" },
				["<F9>"] = { "<cmd>DapContinue<cr>", "Continue" },
				["<C-F8>"] = { "<cmd>DapToggleBreakpoint<cr>", "Toggle Breakpoint" },
				["<F8>"] = { "<cmd>DapStepOver<cr>", "Step Over" },
				["<F7>"] = { "<cmd>DapStepInto<cr>", "Step Into" },
				["<S-F8>"] = { "<cmd>DapStepOut<cr>", "Step Out" },
				["<C-F2>"] = { "<cmd>DapTerminate<cr>", "Terminate" },
				["<C-Tab>"] = { function()
					require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({
						prompt_title = "Switch to",
						previewer = false,
						ignore_current_buffer = true
					}))
				end, "Terminate" },
			})
		end,
	}
}
