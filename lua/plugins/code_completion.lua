return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require 'nvim-treesitter.configs'.setup {
				-- A list of parser names, or "all" (the five listed parsers should always be installed)
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "yaml", "bash", "regex",
					"markdown_inline", "javascript", "typescript", "html", "css", "scss", "vue" },

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				-- List of parsers to ignore installing (or "all")
				-- ignore_install = { "javascript" },

				---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
				-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = '<cr>', -- set to `false` to disable one of the mappings
						scope_incremental = false,
						node_incremental = "<cr>",
						node_decremental = "<S-cr>",
					},
				},

				highlight = { enable = false },

				indent = {
					enable = false
				},

				autotag = {
					enable = true,
					enable_rename = true,
					enable_close = true,
					enable_close_on_slash = true,
				}
			}
			vim.cmd ":TSUpdate"
		end
	},
	{
		-- "hrsh7th/nvim-cmp",
		"llllvvuu/nvim-cmp",
		branch = "feat/above",
		enabled = true,
		dependencies = {
			{
				"linrongbin16/lsp-progress.nvim",
				dependencies = {
					"neovim/nvim-lspconfig",
					"nvim-tree/nvim-web-devicons"
				},
				config = function()
					require("lsp-progress").setup({})
				end
			},
			{
				"neovim/nvim-lspconfig",
				dependencies = { "folke/neodev.nvim" },
				config = function()
					-- Use LspAttach autocommand to only map the following keys
					-- after the language server attaches to the current buffer
					vim.api.nvim_create_autocmd('LspAttach', {
						-- group = vim.api.nvim_create_augroup('UserLspConfig', {}),
						callback = function()
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
			"windwp/nvim-autopairs"
		},
		config = function()
			-- don't pass any arguments, luasnip will find the collection because it is
			-- (probably) in rtp.
			require("luasnip.loaders.from_vscode").lazy_load()
			require 'luasnip'.filetype_extend("all", { "vue" })

			local lspkind = require('lspkind')
			local luasnip = require("luasnip")

			-- If you want insert `(` after select function or method item
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')

			-- Set up nvim-cmp.
			local cmp = require 'cmp'

			cmp.event:on(
				'confirm_done',
				cmp_autopairs.on_confirm_done()
			)

			local ai = require("copilot.suggestion")
			---@diagnostic disable-next-line: missing-fields
			cmp.setup({
				---@diagnostic disable-next-line: missing-fields
				view = {
					entries = {
						name = 'custom',
						selection_order = 'near_cursor',
						vertical_positioning = 'above',
					}
				},

				---@diagnostic disable-next-line: missing-fields
				formatting = {
					format = lspkind.cmp_format({
						mode = 'symbol_text',
						menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[Lua]",
							latex_symbols = "[Latex]",
						}),
						maxwidth = 50,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
						-- The function below will be called before any actual modifications from lspkind
						-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
						---@diagnostic disable-next-line: unused-local
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
				---@diagnostic disable-next-line: missing-fields
				window = {
					-- completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping(function()
						cmp.abort()
						ai.dismiss()
					end
					),

					['<esc>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.abort()
						elseif ai.is_visible() then
							ai.dismiss()
						else
							fallback()
						end
					end
					),


					['<CR>'] = cmp.mapping(function(fallback)
						if cmp.visible() and (cmp.get_active_entry() or not ai.is_visible()) then
							cmp.confirm({
								behavior = cmp.ConfirmBehavior.Replace,
								select = true,
							})
						elseif ai.is_visible() then
							cmp.abort()
							ai.accept()
						else
							fallback()
						end
					end
					),

					["<A-l>"] = cmp.mapping(function(fallback)
						if ai.is_visible() then
							ai.accept_word()
						else
							fallback()
						end
					end
					),

					["<A-CR>"] = cmp.mapping(function(fallback)
						if ai.is_visible() then
							ai.accept_line()
						else
							fallback()
						end
					end
					),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							if luasnip.expand_or_jumpable() then
								luasnip.expand_or_jump()
							else
								fallback()
							end
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
			---@diagnostic disable-next-line: missing-fields
			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			---@diagnostic disable-next-line: missing-fields
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
				-- Format on save
				---@diagnostic disable-next-line: unused-local
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end
					})
				end,
				capabilities = capabilities,
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace"
						},
						workspace = {
							checkThirdParty = false,
						},
						-- diagnostics = {
						-- 	globals = { "vim" }
						-- }
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

			lspconfig.eslint.setup({
				-- Format on save
				capabilities = capabilities,
				---@diagnostic disable-next-line: unused-local
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})

			lspconfig.nil_ls.setup {
				-- Format on save
				---@diagnostic disable-next-line: unused-local
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end
					})
				end,
				capabilities = capabilities,
			}

			lspconfig.marksman.setup {
				capabilities = capabilities,
			}

			lspconfig.jsonls.setup {
				-- Format on save
				---@diagnostic disable-next-line: unused-local
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end
					})
				end,
				capabilities = capabilitiesVSCode,
			}

			lspconfig.html.setup {
				-- Format on save
				---@diagnostic disable-next-line: unused-local
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end
					})
				end,
				capabilities = capabilitiesVSCode,
			}

			lspconfig.cssls.setup {
				-- Format on save
				---@diagnostic disable-next-line: unused-local
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end
					})
				end,
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