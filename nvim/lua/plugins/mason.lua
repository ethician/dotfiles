return {
	{
		"mason-org/mason.nvim",
		enabled = true,
		opts = {
			ensure_installed = {
				"clangd",
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		enabled = true,
	},
}
