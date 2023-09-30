require('options')
require('plugins-manager')

if vim.v.argv[5] == nil then
	vim.cmd('e README.md')
end
