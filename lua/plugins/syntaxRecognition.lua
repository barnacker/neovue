return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
			-- Format on save
			vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					-- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set('n', '<space>wl', function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', '<f2>', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set('n', '<space>f', function()
						vim.lsp.buf.format { async = true }
					end, opts)
				end,
			})
		end,
	},
	{
		"nvim-lua/lsp-status.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
	{
		"SmiteshP/nvim-navic",
		dependencies = {
			"neovim/nvim-lspconfig"
		},
		opts = {
			icons = {
				File = ' ',
				Module = ' ',
				Namespace = ' ',
				Package = ' ',
				Class = ' ',
				Method = ' ',
				Property = ' ',
				Field = ' ',
				Constructor = ' ',
				Enum = ' ',
				Interface = ' ',
				Function = ' ',
				Variable = ' ',
				Constant = ' ',
				String = ' ',
				Number = ' ',
				Boolean = ' ',
				Array = ' ',
				Object = ' ',
				Key = ' ',
				Null = ' ',
				EnumMember = ' ',
				Struct = ' ',
				Event = ' ',
				Operator = ' ',
				TypeParameter = ' '
			},
			lsp = {
				auto_attach = true,
				preference = nil,
			},
			highlight = false,
			separator = " > ",
			depth_limit = 0,
			depth_limit_indicator = "..",
			safe_output = true,
			lazy_update_context = false,
			click = false
		}
	},
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			"neovim/nvim-lspconfig",
			"MunifTanjim/nui.nvim",
			"numToStr/Comment.nvim", -- Optional
			"nvim-telescope/telescope.nvim"
		},
		opts = {
			lsp = { auto_attach = true },
			window = {
				border = "rounded", -- "rounded", "double", "solid", "none"
				-- or an array with eight chars building up the border in a clockwise fashion
				-- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
				size = "60%", -- Or table format example: { height = "40%", width = "100%"}
				position = "50%", -- Or table format example: { row = "100%", col = "0%"}
				scrolloff = nil, -- scrolloff value within navbuddy window
				sections = {
					left = {
						size = "20%",
						border = nil, -- You can set border style for each section individually as well.
					},
					mid = {
						size = "40%",
						border = nil,
					},
					right = {
						-- No size option for right most section. It fills to
						-- remaining area.
						border = nil,
						preview = "leaf", -- Right section can show previews too.
						-- Options: "leaf", "always" or "never"
					}
				},
			},
		}
	},
	{
		"linrongbin16/lsp-progress.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("lsp-progress").setup()
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		build = ":TSUpdate",
		config = function()
			require 'nvim-treesitter.configs'.setup {
				-- A list of parser names, or "all" (the five listed parsers should always be installed)
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "vue", "yaml", "bash", "typescript", "regex",
					"markdown_inline", "html" },

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				-- List of parsers to ignore installing (or "all")
				-- ignore_install = { "javascript" },

				---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
				-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

				highlight = {
					enable = true,

					-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
					-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
					-- the name of the parser)
					-- list of language that will be disabled
					-- disable = { "c", "rust" },
					-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "", -- set to `false` to disable one of the mappings
						node_incremental = "",
						scope_incremental = "grc",
						node_decremental = "<C-S-W>",
					},
				},

				indent = {
					enable = true
				},

				autotag = {
					enable = true,
					enable_rename = true,
					enable_close = true,
					enable_close_on_slash = true,
					-- filetypes = { "html" , "xml" },
				}
			}
		end
	}
}
