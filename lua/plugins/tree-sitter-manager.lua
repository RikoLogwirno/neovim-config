return {
	"romus204/tree-sitter-manager.nvim",
	build = ":TSUpdate",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "TSManager" },
	opts = {
		ensure_installed = {
			"typescript",
			"javascript",
			"java",
			"css",
			"scss",
			"php",
			"sql",
			"go",
		},
	},
}
