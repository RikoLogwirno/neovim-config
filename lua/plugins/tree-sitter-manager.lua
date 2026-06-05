return {
	"romus204/tree-sitter-manager.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "TSManager" },
	opts = {
		ensure_installed = { 
			"typescript", 
			"javascript", 
			"css",
			"scss", 
			"php", 
			"sql", 
			"go" 
		},
	},
}
