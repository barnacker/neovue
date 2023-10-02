-- Space is the leader key <leader>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.relativenumber = true
vim.o.number = true
vim.o.signcolumn = 'yes'
vim.o.clipboard = 'unnamedplus'

vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.termguicolors = true

vim.o.updatetime = 300

vim.o.mouse = 'a'

vim.o.wrap = false
vim.o.laststatus = 3
vim.o.showtabline = 2

vim.o.sessionoptions = "buffers,curdir,folds,localoptions"

-- vim.cmd("syntax off")
vim.cmd([[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]])

if vim.g.neovide then
	-- Put anything you want to happen only in Neovide here
	vim.o.guifont = "IosevkaBarnacker Nerd Font:h12"
	vim.g.neovide_padding_top = 0
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0
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
