local function tab_name(tab)
	return string.gsub(tab, "%[..%]", "")
end

local function tab_modified(tab)
	wins = require("tabby.module.api").get_tab_wins(tab)
	for i, x in pairs(wins) do
		if vim.bo[vim.api.nvim_win_get_buf(x)].modified then
			return ""
		end
	end
	return ""
end

local function lsp_diag(buf)
	diagnostics = vim.diagnostic.get(buf)
	local count = { 0, 0, 0, 0 }

	for _, diagnostic in ipairs(diagnostics) do
		count[diagnostic.severity] = count[diagnostic.severity] + 1
	end
	if count[1] > 0 then
		return vim.bo[buf].modified and "" or ""
	elseif count[2] > 0 then
		return vim.bo[buf].modified and "" or ""
	end
	return vim.bo[buf].modified and "●" or ""
end

local function buffer_name(buf)
	if string.find(buf, "NvimTree") then
		return "NvimTree"
	end
	return buf
end

local theme = {
	fill = 'TabLineFill',
	-- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
	head = 'TabLine',
	current_tab = 'TabLineSel',
	current_win = 'Error',
	tab = 'TabLine',
	win = 'TabLine',
	tail = 'TabLine',
}

return {
	"nanozuki/tabby.nvim",
	config = function()
		require('tabby.tabline').set(function(line)
			return {
				{
					{ ' neovue ', hl = theme.head },
					line.sep('', theme.head, theme.fill),
				},
				line.tabs().foreach(function(tab)
					local hl = tab.is_current() and theme.current_tab or theme.tab
					return {
						line.sep('', hl, theme.fill),
						not tab.is_current() and tab.number() .. '' or '',
						tab.name(),
						tab.close_btn(''),
						line.sep('', hl, theme.fill),
						hl = hl,
						margin = ' ',
					}
				end),
				line.sep('', theme.win, theme.fill),
				line.spacer(),
				line.sep('', theme.win, theme.fill),
				line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
					local hl = win.is_current() and theme.current_win or theme.tab
					return {
						line.sep('', hl, theme.fill),
						buffer_name(win.buf_name()),
						lsp_diag(win.buf().id),
						line.sep('', hl, theme.fill),
						hl = hl,
						margin = ' ',
					}
				end),
				{
					line.sep('', theme.tail, theme.fill),
					{ '  ', hl = theme.tail },
				},
				hl = theme.fill,
			}
		end)
	end
}
