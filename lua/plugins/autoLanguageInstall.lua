return {
	-- Those plugins will take care of automatically install Language Servers and Serving the Native LSPConfig "demands"
	-- Go to the syntaxRecongnition.lua file to add specific language support
	{
		"williamboman/mason.nvim",
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				opts = { automatic_installation = true },
			},
			"neovim/nvim-lspconfig",
		},
		opts = {},
	}
}
