return {
	{
		"SmiteshP/nvim-navic",
    dependencies = {
			"neovim/nvim-lspconfig"
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local util = require 'lspconfig.util'
			local function get_typescript_server_path(root_dir)
			  local global_ts = '/home/barnacker/.npm-global/lib/node_modules/typescript/lib'
			  -- Alternative location if installed as root:
			  -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
			  local found_ts = ''
			  local function check_dir(path)
			    found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
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

			local navic = require("nvim-navic")

			local on_attach = function(client, bufnr)
			    if client.server_capabilities.documentSymbolProvider then
			        navic.attach(client, bufnr)
			    end
			end

			require'lspconfig'.volar.setup({
				--on_attach = on_attach,
				on_attach = function(client, bufnr)
        	navic.attach(client, bufnr)
    		end,
			  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
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
			require'lspconfig'.lua_ls.setup({
				on_attach = on_attach,
				on_new_config = function(new_config, new_root_dir)
  			  new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  			end,
			  on_init = function(client)
			    local path = client.workspace_folders[1].name
			    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
			      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
			        Lua = {
			          runtime = {
			            -- Tell the language server which version of Lua you're using
			            -- (most likely LuaJIT in the case of Neovim)
			            version = 'LuaJIT'
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

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd('LspAttach', {
			  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			  callback = function(ev)
			    -- Enable completion triggered by <c-x><c-o>
			    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

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
			    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
			    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
			    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
			    vim.keymap.set('n', '<space>f', function()
			      vim.lsp.buf.format { async = true }
			    end, opts)
			  end,
			})
		end,
	},
}
