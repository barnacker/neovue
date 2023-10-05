return {
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = {
			"catppuccin",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			-- highlights = require("catppuccin.groups.integrations.bufferline").get(),

			options = {
				separator_style = "slant",

				offsets = {
					{
						-- filetype = "neo-tree",
						filetype = "NvimTree",
						text = "Project",
						text_align = "center",
						separator = false
					}
				},
				diagnostics = "nvim_lsp",

				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and "󰅜 "
								or (e == "warning" and " " or "󰌵 ")
						s = s .. n .. sym
					end
					return s
				end
			}
		}
	}
}
