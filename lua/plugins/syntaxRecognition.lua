return {
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
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"SmiteshP/nvim-navbuddy",
				dependencies = {
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
			}
		},
		config = function()
			local util = require 'lspconfig.util'
			local function get_typescript_server_path(root_dir)
				local global_ts = '/home/barnacker/.npm-global/lib/node_modules/typescript/lib'
				-- Alternative location if installed as root:
				-- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
				local found_ts = ''
				local function check_dir(path)
					found_ts = util.path.join(path, 'node_modules', 'typescript', 'lib')
					if util.path.exists(found_ts) then
						return path
					end
				end
				if util.search_ancestors(root_dir, check_dir) then
					return found_ts
				else
					return global_ts
				end
			end

			local lsp_status = require('lsp-status')
			lsp_status.register_progress()

			--Enable (broadcasting) snippet capability for completion
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			require 'lspconfig'.html.setup {
				handlers = lsp_status.extensions.clangd.setup(),
				on_attach = lsp_status.on_attach,
				capabilities = capabilities
			}

			require 'lspconfig'.volar.setup({
				handlers = lsp_status.extensions.clangd.setup(),
				on_attach = lsp_status.on_attach,
				capabilities = lsp_status.capabilities,
				filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json', 'html' },
				init_options = {
					languageFeatures = {
						references = true,
						definition = true,
						typeDefinition = true,
						callHierarchy = true,
						hover = true,
						rename = true,
						signatureHelp = true,
						codeAction = true,
						completion = {
							defaultTagNameCase = 'kebabCase',
							defaultAttrNameCase = 'kebabCase',
							getDocumentNameCasesRequest = true,
							getDocumentSelectionRequest = true,
						},
						documentLink = true,
						codeLens = true,
						diagnostics = true,
					},
					documentFeatures = {
						selectionRange = true,
						foldingRange = true,
						documentSymbol = true,
						documentColor = true,
						documentFormatting = {
							defaultPrintWidth = 100,
							getDocumentPrintWidthRequest = true,
						},
					},
				},
			})

			require 'lspconfig'.lua_ls.setup({
				handlers = lsp_status.extensions.clangd.setup(),
				on_attach = lsp_status.on_attach,
				capabilities = lsp_status.capabilities,
				on_new_config = function(new_config, new_root_dir)
					new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
				end,

				on_init = function(client)
					local path = client.workspace_folders[1].name
					if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
						client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
							Lua = {
								runtime = {
									-- Tell the language server which version of Lua you're using
									-- (most likely LuaJIT in the case of Neovim)
									version = 'LuaJIT'
								},
								diagnostics = {
									-- Get the language server to recognize the `vim` global
									globals = {
										'vim',
									},
								},
								-- Make the server aware of Neovim runtime files
								workspace = {
									checkThirdParty = false,
									library = {
										vim.env.VIMRUNTIME
										-- "${3rd}/luv/library"
										-- "${3rd}/busted/library",
									}
									-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
									-- library = vim.api.nvim_get_runtime_file("", true)
								}
							}
						})
						client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
					end
					return true
				end
			})

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
	}
}
