-- space is the leader key <leader>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.relativenumber = true
vim.o.number = true
vim.o.signcolumn = 'yes'
vim.o.clipboard = 'unnamedplus'

vim.o.scrolloff = 5
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.g.loaded_netrw = 1
vim.g.loaded_netrwplugin = 1
vim.o.termguicolors = true

vim.o.updatetime = 300

vim.o.mouse = 'a'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wrap = false
vim.o.laststatus = 3
vim.o.showtabline = 2
vim.o.showcmdloc = 'statusline'

vim.o.spell = false

vim.fn.sign_define("DiagnosticSignError",
	{ text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
	{ text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
	{ text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
	{ text = "󰌵", texthl = "DiagnosticSignHint" })

vim.fn.sign_define('DapBreakpoint',
	{ text = '', texthl = 'DapBreakpointIcon', numhl = 'DapBreakpointIcon' })
vim.fn.sign_define('DapBreakpointCondition',
	{ text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected',
	{ text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint',
	{ text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
vim.fn.sign_define('DapStopped',
	{ text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

vim.opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"
vim.cmd("set sessionoptions-=buffers")

-- vim.cmd("syntax off")
vim.cmd([[au filetype * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]])
vim.cmd([[au CursorHold * checktime]])

if vim.g.neovide then
	-- put anything you want to happen only in neovide here
	vim.o.guifont = "Agave Nerd Font:h12"
	-- vim.o.guifont = "IosevkaBarnacker Nerd Font:h11"
	-- vim.o.guifont = "CaskaydiaCove Nerd Font:h11"
	-- vim.g.neovide_padding_top = 0
	-- vim.g.neovide_padding_bottom = 0
	-- vim.g.neovide_padding_right = 0
	-- vim.g.neovide_padding_left = 0
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
	vim.g.neovide_cursor_vfx_particle_density = 80.0
	vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
	vim.g.neovide_cursor_vfx_opacity = 200.0
	vim.g.neovide_cursor_vfx_particle_speed = 50.0
	vim.cmd [[
" system clipboard
nmap <c-c> "+y
vmap <c-c> "+y
nmap <c-v> "+p
inoremap <c-v> <c-r>+
cnoremap <c-v> <c-r>+
" use <c-r> to insert original character without triggering things like auto-pairs
inoremap <c-r> <c-v>
]]
end


vim.g.copilot_assume_mapped = true
vim.g.copilot_keymap = '<c-space>'

vim.o.swapfile = false
vim.o.backup = false
if vim.fn.has("persistent_undo") then
	local target_path = vim.fn.expand('~/.local/state/nvim/undo')

	-- create the directory and any parent directories
	-- if the location does not exist.
	if not vim.fn.isdirectory(target_path) then
		vim.fn.mkdir(target_path, "p", 0700)
	end

	vim.o.undodir = target_path
	vim.o.undofile = true
end
