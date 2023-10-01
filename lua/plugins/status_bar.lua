return {
	{
		"rebelot/heirline.nvim",
		event = "UiEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"lewis6991/gitsigns.nvim",
			"SmiteshP/nvim-navic",
			"linrongbin16/lsp-progress.nvim",
		},
		config = function()
			local conditions   = require("heirline.conditions")
			local utils        = require("heirline.utils")

			local colors       = {
				bright_bg = utils.get_highlight("Folded").bg,
				bright_fg = utils.get_highlight("Folded").fg,
				red = utils.get_highlight("DiagnosticError").fg,
				dark_red = utils.get_highlight("DiffDelete").bg,
				green = utils.get_highlight("String").fg,
				blue = utils.get_highlight("Function").fg,
				gray = utils.get_highlight("NonText").fg,
				orange = utils.get_highlight("Constant").fg,
				purple = utils.get_highlight("Statement").fg,
				cyan = utils.get_highlight("Special").fg,
				diag_warn = utils.get_highlight("DiagnosticWarn").fg,
				diag_error = utils.get_highlight("DiagnosticError").fg,
				diag_hint = utils.get_highlight("DiagnosticHint").fg,
				diag_info = utils.get_highlight("DiagnosticInfo").fg,
				git_del = utils.get_highlight("diffRemoved").fg,
				git_add = utils.get_highlight("diffAdded").fg,
				git_change = utils.get_highlight("diffChanged").fg,
			}

			local ViMode       = {
				-- get vim current mode, this information will be required by the provider
				-- and the highlight functions, so we compute it only once per component
				-- evaluation and store it as a component attribute
				init = function(self)
					self.mode = vim.fn.mode(1) -- :h mode()
				end,
				-- Now we define some dictionaries to map the output of mode() to the
				-- corresponding string and color. We can put these into `static` to compute
				-- them at initialisation time.
				static = {
					mode_names = { -- change the strings if you like it vvvvverbose!
						n = " ",
						no = " ?",
						nov = " ?",
						noV = " ?",
						["no\22"] = " ?",
						niI = " i",
						niR = " r",
						niV = " v",
						nt = " t",
						v = "󰩬 ",
						vs = "󰩬 s",
						V = "󰘤 ",
						Vs = "󰩬 s",
						["\22"] = "󰩬 ",
						["\22s"] = "^󰩬 ",
						s = "S",
						S = "S_",
						["\19"] = "^S",
						i = "󰓥 ",
						ic = "󰓥 c",
						ix = "󰓥 x",
						R = "R",
						Rc = "Rc",
						Rx = "Rx",
						Rv = "Rv",
						Rvc = "Rv",
						Rvx = "Rv",
						c = " ",
						cv = "Ex",
						r = "...",
						rm = "M",
						["r?"] = "?",
						["!"] = "!",
						t = "T",
					},
					mode_colors = {
						n = "green",
						i = "white",
						v = "cyan",
						V = "cyan",
						["\22"] = "cyan",
						c = "orange",
						s = "purple",
						S = "purple",
						["\19"] = "purple",
						R = "orange",
						r = "orange",
						["!"] = "red",
						t = "red",
					}
				},
				-- We can now access the value of mode() that, by now, would have been
				-- computed by `init()` and use it to index our strings dictionary.
				-- note how `static` fields become just regular attributes once the
				-- component is instantiated.
				-- To be extra meticulous, we can also add some vim statusline syntax to
				-- control the padding and make sure our string is always at least 2
				-- characters long. Plus a nice Icon.
				provider = function(self)
					return "%2(" .. self.mode_names[self.mode] .. "%)"
				end,
				-- Same goes for the highlight. Now the foreground will change according to the current mode.
				hl = function(self)
					local mode = self.mode:sub(1, 1) -- get only the first mode character
					return { fg = self.mode_colors[mode], bold = true, }
				end,
				-- Re-evaluate the component only on ModeChanged event!
				-- Also allows the statusline to be re-evaluated when entering operator-pending mode
				update = {
					"ModeChanged",
					pattern = "*:*",
					callback = vim.schedule_wrap(function()
						vim.cmd("redrawstatus")
					end),
				},
			}

			local FileType     = {
				provider = function()
					return string.upper(vim.bo.filetype)
				end,
				hl = { fg = utils.get_highlight("Type").fg, bold = true },
			}

			local FileEncoding = {
				provider = function()
					return vim.bo.fenc or vim.o.enc -- :h 'enc'
				end,
				hl = { fg = utils.get_highlight("Type").fg, bold = true },
			}

			local FileFormat   = {
				provider = function()
					return vim.bo.fileformat
				end,
				hl = { fg = utils.get_highlight("Type").fg, bold = true },
			}

			local FileSize     = {
				provider = function()
					-- stackoverflow, compute human readable file size
					local suffix = { 'b', 'k', 'M', 'G', 'T', 'P', 'E' }
					local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
					fsize = (fsize < 0 and 0) or fsize
					if fsize < 1024 then
						return fsize .. suffix[1]
					end
					local i = math.floor((math.log(fsize) / math.log(1024)))
					return string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i + 1])
				end
			}

			local TerminalName = {
				-- we could add a condition to check that buftype == 'terminal'
				-- or we could do that later (see #conditional-statuslines below)
				provider = function()
					local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
					return " " .. tname
				end,
				hl = { fg = "blue", bold = true },
			}

			local HelpFileName = {
				condition = function()
					return vim.bo.filetype == "help"
				end,
				provider = function()
					local filename = vim.api.nvim_buf_get_name(0)
					return vim.fn.fnamemodify(filename, ":t")
				end,
				hl = { fg = colors.blue },
			}

			local Git          = {
				condition = conditions.is_git_repo,

				init = function(self)
					self.status_dict = vim.b.gitsigns_status_dict
					self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or
							self.status_dict.changed ~= 0
				end,

				hl = { fg = "orange" },


				{ -- git branch name
					provider = function(self)
						return " " .. self.status_dict.head
					end,
					hl = { bold = true }
				},
				-- You could handle delimiters, icons and counts similar to Diagnostics
				{
					condition = function(self)
						return self.has_changes
					end,
					provider = "("
				},
				{
					provider = function(self)
						local count = self.status_dict.added or 0
						return count > 0 and ("+" .. count)
					end,
					hl = { fg = "git_add" },
				},
				{
					provider = function(self)
						local count = self.status_dict.removed or 0
						return count > 0 and ("-" .. count)
					end,
					hl = { fg = "git_del" },
				},
				{
					provider = function(self)
						local count = self.status_dict.changed or 0
						return count > 0 and ("~" .. count)
					end,
					hl = { fg = "git_change" },
				},
				{
					condition = function(self)
						return self.has_changes
					end,
					provider = ")",
				},
			}

			-- We're getting minimalists here!
			local Ruler        = {
				-- %l = current line number
				-- %L = number of lines in the buffer
				-- %c = column number
				-- %P = percentage through file of displayed window
				provider = "%l:%c %P",
			}

			local MacroRec     = {
				condition = function()
					return vim.fn.reg_recording() ~= "" and vim.o.cmdheight == 0
				end,
				provider = " ",
				hl = { fg = "orange", bold = true },
				utils.surround({ "[", "]" }, nil, {
					provider = function()
						return vim.fn.reg_recording()
					end,
					hl = { fg = "green", bold = true },
				}),
				update = {
					"RecordingEnter",
					"RecordingLeave",
				}
			}

			vim.opt.showcmdloc = 'statusline'
			local ShowCmd      = {
				condition = function()
					return vim.o.cmdheight == 0
				end,
				provider = ":%3.5(%S%)",
			}

			local LSPMessages  = {
				-- condition = #vim.lsp.buf_get_clients() > 0,
				provider = function()
					-- return require('lsp-progress').progress()
					return require("lsp-progress").progress({
						format = function(messages)
							return #messages > 0 and table.concat(messages, " ") or ""
						end,
					})
				end
			}

			local LSPActive    = {
				condition = conditions.lsp_attached,
				update    = { 'LspAttach', 'LspDetach' },
				provider  = function()
					local names = {}
					for i, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
						table.insert(names, server.name)
					end
					return " [" .. table.concat(names, " ") .. "]"
				end,
			}

			-- listen lsp-progress event and refresh lualine
			vim.api.nvim_create_augroup("heirline_augroup", { clear = true })
			vim.api.nvim_create_autocmd("User LspProgressStatusUpdated", {
				group = "heirline_augroup",
				callback = vim.schedule_wrap(
					function()
						vim.cmd("redrawstatus")
					end
				)
			})


			local Align = { provider = "%=" }
			local Space = { provider = " " }

			-- ViMode = utils.surround({ "", " " }, "black", { ViMode })
			--
			local IgnoredStatusline = {
				condition = function()
					return conditions.buffer_matches({
						filetype = { "neo-tree" },
					})
				end,

				provider = "sadln",
				hl = { bg = "dark_red" },

			}

			local DefaultStatusline = {
				--ViMode, Space, FileNameBlock, Space, Git, Space, Diagnostics, Align,
				ViMode, Space, Git, Space, LSPActive, Space, Align,
				--Navic, DAPMessages, Align,
				LSPMessages, Align,
				--LSPActive, Space, LSPMessages, Space, UltTest, Space, FileType, Space, Ruler, Space, ScrollBar
				MacroRec, Space, FileEncoding, Space, FileFormat, Space, Ruler, Space, FileSize
			}

			local InactiveStatusline = {
				condition = conditions.is_not_active,
				provider = "",
			}

			local SpecialStatusline = {
				condition = function()
					return conditions.buffer_matches({
						buftype = { "nofile", "prompt", "help", "quickfix" },
						filetype = { "^git.*", "fugitive" },
					})
				end,

				FileType,
				Space,
				HelpFileName,
				Align
			}

			local TerminalStatusline = {

				condition = function()
					return conditions.buffer_matches({ buftype = { "terminal" } })
				end,

				hl = { bg = "dark_red" },

				-- Quickly add a condition to the ViMode to only show it when buffer is active!
				{ condition = conditions.is_active, ViMode, Space },
				FileType,
				Space,
				TerminalName,
				Align,
			}

			local StatusLines = {

				hl = function()
					if conditions.is_active() then
						return "StatusLine"
					else
						return "StatusLineNC"
					end
				end,

				-- the first statusline with no condition, or which condition returns true is used.
				-- think of it as a switch case with breaks to stop fallthrough.
				fallthrough = false,

				SpecialStatusline,
				TerminalStatusline,
				InactiveStatusline,
				DefaultStatusline,
			}

			require("heirline").setup({
				statusline = StatusLines,
				opts = { colors = colors }
			})
		end,
	}
}
