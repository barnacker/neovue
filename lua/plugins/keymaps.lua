return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 1000
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
			})
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
				vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
			end

			-- if you only want these mappings for toggle term use term://*toggleterm#* instead
			vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
			wk.add({
				{ "\\",  focus_pane,                 desc = "Go to Project Pane" },
				{ "\19", "<cmd>w<cr><esc>",          desc = "Save",              mode = { "i", "n" } },
				{ "\28", "<cmd>Lspsaga outline<cr>", desc = "Toggle Outline" },
				{
					"-",
					function()
						require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({
							prompt_title = "Switch to",
							previewer = false,
							ignore_current_buffer = true
						}))
					end,
					desc = "Buffer selector"
				},
				{ "<A-,>", "<cmd>tabp<cr>", desc = "Previous Tab" },
				{ "<A-.>", "<cmd>tabn<cr>", desc = "Next Tab" },
				{ "<A-1>", "<cmd>tabn 1<cr>", desc = "Go to tab 1" },
				{ "<A-2>", "<cmd>tabn 2<cr>", desc = "Go to tab 2" },
				{ "<A-3>", "<cmd>tabn 3<cr>", desc = "Go to tab 3" },
				{ "<A-4>", "<cmd>tabn 4<cr>", desc = "Go to tab 4" },
				{ "<A-5>", "<cmd>tabn 5<cr>", desc = "Go to tab 5" },
				{ "<A-6>", "<cmd>tabn 6<cr>", desc = "Go to tab 6" },
				{ "<A-7>", "<cmd>tabn 7<cr>", desc = "Go to tab 7" },
				{ "<A-8>", "<cmd>tabn 8<cr>", desc = "Go to tab 8" },
				{ "<A-9>", "<cmd>tabn 9<cr>", desc = "Go to tab 9" },
				{ "<A-h>", "<C-w>h", desc = "Left Window" },
				{ "<A-j>", "<C-w>j", desc = "Down Window" },
				{ "<A-k>", "<C-w>k", desc = "Up Window" },
				{ "<A-l>", "<C-w>l", desc = "Right Window" },
				{ "<A-w>", "<cmd>tabclose<cr>", desc = "Close Tab" },
				{ "<A-x>", "<C-w>q", desc = "Close Window" },
				{ "<C-,>", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Previous Diagnostic" },
				{ "<C-.>", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic" },
				{ "<C-=>", "<C-w>=", desc = "Equalize Windows Sizes" },
				{ "<C-A-,>", "<cmd>-tabmove<cr>", desc = "Move Tab Back" },
				{ "<C-A-.>", "<cmd>+tabmove<cr>", desc = "Move Tab Forward" },
				{ "<C-F2>", "<cmd>DapTerminate<cr>", desc = "Terminate" },
				{ "<C-h>", "<C-w><", desc = "Decrease Window Width" },
				{ "<C-j>", "<C-w>-", desc = "Decrease Window Height" },
				{ "<C-k>", "<C-w>+", desc = "Increase Window Height" },
				{ "<C-l>", "<C-w>>", desc = "Increase Window Width" },
				{ "<C-n>", "<cmd>$tabnew<cr>", desc = "New tab" },
				{ "<F32>", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
				{ "<F33>", require('dap').disconnect, desc = "Disconnect" },
				{ "<F5>", "<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>", desc = "Local History" },
				{ "<F7>", "<cmd>DapStepInto<cr>", desc = "Step Into" },
				{ "<F8>", "<cmd>DapStepOver<cr>", desc = "Step Over" },
				{ "<F9>", "<cmd>DapContinue<cr>", desc = "Continue" },
				{ "<M-Bslash>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Project Pane" },
				{ "<S-F8>", "<cmd>DapStepOut<cr>", desc = "Step Out" },
				{ "<esc>", "<cmd>noh<cr>", desc = "Clear Search" },
				{ "<f2>", "<cmd>Lspsaga rename<cr>", desc = "Rename Symbol" },
				{ "<leader>", group = "󰶆 leader menu..." },
				{ "<leader><cr>", "i<cr><esc>", desc = "new line" },
				{ "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = " find files" },
				{ "<leader>?", "<cmd>WhichKey<cr>", desc = "Show All Mappings" },
				{ "<leader>D", "<cmd>Lspsaga show_workspace_diagnostics ++float<cr>", desc = "Diagnostics (Workspace)" },
				{ "<leader>b", group = "breakpoints..." },
				{ "<leader>bb", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint <Ctrl-F8>" },
				{ "<leader>bc", "<cmd>DapContinue<cr>", desc = "Continue <F9>" },
				{ "<leader>bi", "<cmd>DapStepInto<cr>", desc = "Step Into <F7>" },
				{ "<leader>bl", "<cmd>Telescope dap list_breakpoints<cr>", desc = "list" },
				{ "<leader>bo", "<cmd>DapStepOver<cr>", desc = "Step Over <F8>" },
				{ "<leader>bt", "<cmd>DapStepOut<cr>", desc = "Step Out <Shift-F8>" },
				{ "<leader>bx", "<cmd>DapTerminate<cr>", desc = "Terminate <Ctrl-F2>" },
				{ "<leader>c", group = "code..." },
				{ "<leader>ca", "<cmd> Lspsaga code_action<cr>", desc = "action" },
				{ "<leader>cf", "<cmd> Lspsaga finder<cr>", desc = "find" },
				{ "<leader>d", "<cmd>Lspsaga show_buf_diagnostics ++float<cr>", desc = "diagnostics (Buffer)" },
				{ "<leader>f", group = "find..." },
				{ "<leader>fa", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", desc = " find all" },
				{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "diagnostics" },
				{ "<leader>fh", "<cmd>Telescope oldfiles<cr>", desc = "file history" },
				{ "<leader>fn", "<cmd>Telescope notify<cr>", desc = "notification" },
				{ "<leader>fr", "<cmd>Telescope resume<cr>", desc = "resume search" },
				{ "<leader>fs", "<cmd>Telescope possession list<cr>", desc = "session" },
				{ "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "text in files" },
				{ "<leader>fx", "<cmd>TodoTelescope<cr>", desc = "TODOs" },
				{ "<leader>h", "<cmd>Lspsaga hover_doc<cr>", desc = "hover code" },
				{ "<leader>j", group = "jump to..." },
				{ "<leader>jd", "<cmd>Lspsaga goto_definition<cr>", desc = "definition" },
				{ "<leader>jt", "<cmd>Lspsaga goto_type_definition<cr>", desc = "type definition" },
				{ "<leader>p", group = "peek..." },
				{ "<leader>pd", "<cmd>Lspsaga peek_definition<cr>", desc = "definition" },
				{ "<leader>pt", "<cmd>Lspsaga peek_type_definition<cr>", desc = "type definition" },
				{ "<leader>q", "<cmd>qa!<cr>", desc = " quit all" },
				{ "<leader>s", group = "swap..." },
				{ "<leader>sn", group = "next..." },
				{ "<leader>sp", group = "previous..." },
				{ "<leader>t", group = "tabs..." },
				{ "<leader>tn", "<cmd>$tabnew<cr>", desc = "new tab" },
				{ "<leader>to", "<cmd>tabonly<cr>", desc = "close all other tabs" },
				{ "<leader>tx", "<cmd>tabclose<cr>", desc = "close this tab" },
				{ "<leader>z", "<cmd>Lazy<cr>", desc = "鈴 lazy plugins" },
			})
		end,
	}
}
