return {
	{
		"hrsh7th/nvim-cmp",
		enabled = true,
		dependencies = {
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
				"neovim/nvim-lspconfig",
				config = function()
					-- Format on save
					vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

					-- Use LspAttach autocommand to only map the following keys
					-- after the language server attaches to the current buffer
					vim.api.nvim_create_autocmd('LspAttach', {
						-- group = vim.api.nvim_create_augroup('UserLspConfig', {}),
						callback = function(ev)
						end
					})
				end,
			},
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

			-- Set up lspconfig.
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			-- capabilities.semanticTokensProvider = nil

			local capabilitiesVSCode = capabilities
			--Enable (broadcasting) snippet capability for completion
			capabilitiesVSCode.textDocument.completion.completionItem.snippetSupport = true

			lspconfig.lua_ls.setup {
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
				capabilities = capabilities,
			}

			lspconfig.marksman.setup {
				capabilities = capabilities,
			}

			lspconfig.jsonls.setup {
				capabilities = capabilitiesVSCode,
			}

			lspconfig.html.setup {
				capabilities = capabilitiesVSCode,
			}

			lspconfig.cssls.setup {
				capabilities = capabilitiesVSCode,
			}

			lspconfig.emmet_language_server.setup {
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
}
