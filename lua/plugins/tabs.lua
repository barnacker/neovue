local theme = {
	fill = 'TabLineFill',
	-- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
	head = 'TabLineSel',
	win = 'TabLine',
	current_win_error = "WinErr",
	current_win_ok = "WinOK",
	tab = 'TabLine',
	current_tab = 'TabLineSel',
	tail = 'TabLineSel',
}

local function tab_diagnostics(tab)
	local wins = require("tabby.module.api").get_tab_wins(tab.id)
	---@diagnostic disable-next-line: unused-local
	for i, x in pairs(wins) do
		local diagnostics = vim.diagnostic.get(vim.api.nvim_win_get_buf(x))
		for _, diagnostic in ipairs(diagnostics) do
			if diagnostic.severity < 4 then
				return "󰇷"
			end
		end
	end
	return ""
end

local function tab_modified(tab)
	local wins = require("tabby.module.api").get_tab_wins(tab.id)
	---@diagnostic disable-next-line: unused-local
	for i, x in pairs(wins) do
		if vim.bo[vim.api.nvim_win_get_buf(x)].modified then
			return "●"
		end
	end
	return ""
end

local function buf_modified(buf)
	if vim.bo[buf].modified then
		return "●"
	end
	return ""
end

local function lsp_diag(buf)
	local diagnostics = vim.diagnostic.get(buf)
	local count = { 0, 0, 0, 0 }
	local diagformat = "%d%s"
	local diagstring = {}

	for _, diagnostic in ipairs(diagnostics) do
		count[diagnostic.severity] = count[diagnostic.severity] + 1
	end
	if count[1] > 0 then
		table.insert(diagstring, string.format(diagformat, count[1], ""))
	end
	if count[2] > 0 then
		table.insert(diagstring, string.format(diagformat, count[2], ""))
	end
	if count[3] > 0 then
		table.insert(diagstring, string.format(diagformat, count[3], ""))
	end
	if count[4] > 0 then
		table.insert(diagstring, string.format(diagformat, count[4], "󰌵"))
	end
	if next(diagstring) == nil then
		return {
			error = false,
			display = ""
		}
	end
	return {
		error = true,
		display = table.concat(diagstring, " ")
	}
end

local function buffer_name(buf)
	if string.find(buf, "NvimTree") then
		return "NvimTree"
	end
	return buf
end

return {
	"nanozuki/tabby.nvim",
	event = "VeryLazy",
	config = function()
		require('tabby.tabline').set(function(line)
			return {
				{
					{ '󰽙 ', hl = theme.fill },
				},
				line.tabs().foreach(function(tab)
					local hl = tab.is_current() and theme.current_tab or theme.tab
					return {
						line.sep('', hl, theme.fill),
						not tab.is_current() and tab.number() or '',
						tab_modified(tab),
						tab.name() .. tab_diagnostics(tab),
						tab.close_btn(''),
						line.sep('', hl, theme.fill),
						hl = hl,
						margin = ' ',
					}
				end),
				line.truncate_point(),
				line.sep('', theme.tail, theme.fill),
				line.spacer(),

				line.sep('', theme.tail, theme.fill),
				line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
					local diag = lsp_diag(win.buf().id)
					local hl = win.is_current()
							and (
								diag.error
								and theme.current_win_error
								or theme.current_win_ok
							)
							or theme.win
					return {
						line.sep('', hl, theme.fill),
						buf_modified(win.buf().id),
						buffer_name(win.buf_name()),
						diag.display,
						line.sep('', hl, theme.fill),
						hl = hl,
						margin = ' ',
					}
				end),
				{
					{ '  ', hl = theme.fill },
				},
				hl = theme.fill,
			}
		end)
	end
}
