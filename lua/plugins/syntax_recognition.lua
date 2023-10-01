return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Format on save
			vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd('LspAttach', {
				-- group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					-- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					-- local opts = { buffer = ev.buf }
					-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
					-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
					-- vim.keymap.set('n', '<space>wl', function()
					-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					-- end, opts)
					-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
					-- vim.keymap.set('n', '<f2>', vim.lsp.buf.rename, opts)
					-- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
					-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
				end
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
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			{
				"L3MON4D3/LuaSnip",
				-- follow latest release.
				version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				-- install jsregexp (optional!).
				build = "make install_jsregexp",
				opts = {
					store_selection_keys = '<c-x>',
				}
			},
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/cmp-luasnip-choice",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
		config = function()
			-- don't pass any arguments, luasnip will find the collection because it is
			-- (probably) in rtp.
			require("luasnip.loaders.from_vscode").lazy_load()
			require 'luasnip'.filetype_extend("all", { "vue" })

			local lspkind = require('lspkind')

			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local luasnip = require("luasnip")

			-- If you want insert `(` after select function or method item
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')

			-- Set up nvim-cmp.
			local cmp = require 'cmp'

			cmp.event:on(
				'confirm_done',
				cmp_autopairs.on_confirm_done()
			)

			cmp.setup({
				formatting = {
					format = lspkind.cmp_format({
						mode = 'symbol', -- show only symbol annotations
						maxwidth = 50,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
						-- The function below will be called before any actual modifications from lspkind
						-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
						before = function(entry, vim_item)
							-- Customizations here...
							return vim_item
						end
					})
				},
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
							-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
							-- they way you will only jump inside the snippet region
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = 'luasnip_choice' },
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' }, -- For luasnip users.
				}, {
					{ name = 'buffer' },
					{ name = 'path' }
				})
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				})
			})

			local lspconfig = require("lspconfig")
			local lsp_status = require('lsp-status')
			lsp_status.register_progress()

			-- Set up lspconfig.
			local capabilities = require('cmp_nvim_lsp').default_capabilities(lsp_status.capabilities)
			local capabilitiesVSCode = require('cmp_nvim_lsp').default_capabilities(lsp_status.capabilities)
			--Enable (broadcasting) snippet capability for completion
			capabilitiesVSCode.textDocument.completion.completionItem.snippetSupport = true

			lspconfig.lua_ls.setup {
				on_attach = lsp_status.on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						}
					}
				}
			}

			lspconfig.volar.setup {
				on_attach = lsp_status.on_attach,
				capabilities = capabilities,
				filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
				init_options = {
					vue = {
						autoInsert = {
							bracketSpacing = true,
							dotValue = true,
							parentheses = true,
						},
						codeActions = {
							enabled = true,
							savingTimeLimit = 1000,
						},
						codeLens = {
							enabled = true,
						},
						complete = {
							casing = {
								props = "autoKebab",
								status = true,
								tags = "autoPascal",
							},
							normalizeComponentImportName = true,
						},
						doctor = {
							status = true,
						},
						inlayHints = {
							inlineHandlerLeading = true,
							missingProps = true,
							optionsWrapper = true,
						},
						server = {
							diagnosticModel = "push",
							fullCompletionList = false,
							maxFileSize = 20971520,
							petiteVue = {
								supportHtmlFile = false,
							},
							reverseConfigFilePriority = false,
							runtime = "node",
							vitePress = {
								supportMdFile = false,
							},
						},
					},
				},
			}

			lspconfig.nil_ls.setup {
				on_attach = lsp_status.on_attach,
				capabilities = capabilities,
			}

			lspconfig.marksman.setup {
				on_attach = lsp_status.on_attach,
				capabilities = capabilities,
			}

			lspconfig.jsonls.setup {
				on_attach = lsp_status.on_attach,
				capabilities = capabilitiesVSCode,
			}

			lspconfig.html.setup {
				on_attach = lsp_status.on_attach,
				capabilities = capabilitiesVSCode,
			}

			lspconfig.cssls.setup {
				on_attach = lsp_status.on_attach,
				capabilities = capabilitiesVSCode,
			}

			lspconfig.emmet_language_server.setup {
				on_attach = lsp_status.on_attach,
				capabilities = capabilities,
				filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug",
					"typescriptreact", "vue" },
				-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
				-- **Note:** only the options listed in the table are supported.
				init_options = {
					--- @type string[]
					excludeLanguages = {},
					--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
					preferences = {},
					--- @type boolean Defaults to `true`
					showAbbreviationSuggestions = true,
					--- @type "always" | "never" Defaults to `"always"`
					showExpandedAbbreviation = "always",
					--- @type boolean Defaults to `false`
					showSuggestionsAsSnippets = false,
					--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
					syntaxProfiles = {},
					--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
					variables = {},
				},
			}
		end,
	},
	{
		'numToStr/Comment.nvim',
		opts = {
			---Add a space b/w comment and the line
			padding = true,
			---Whether the cursor should stay at its position
			sticky = true,
			---Lines to be ignored while (un)comment
			ignore = nil,
			---LHS of toggle mappings in NORMAL mode
			toggler = {
				---Line-comment toggle keymap
				line = '<C-/>',
				---Block-comment toggle keymap
				block = 'gbc',
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
				line = '<C-/>',
				---Block-comment keymap
				block = 'gb',
			},
			---LHS of extra mappings
			extra = {
				---Add comment on the line above
				above = 'gcO',
				---Add comment on the line below
				below = 'gco',
				---Add comment at the end of line
				eol = 'gcA',
			},
			---Enable keybindings
			---NOTE: If given `false` then the plugin won't create any mappings
			mappings = {
				---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
				basic = true,
				---Extra mapping; `gco`, `gcO`, `gcA`
				extra = true,
			},
			---Function to call before (un)comment
			pre_hook = nil,
			---Function to call after (un)comment
			post_hook = nil,
		},
		lazy = false,
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.3',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' },
		init = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<C-S-N>', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		end
	},
}
