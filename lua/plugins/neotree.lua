return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	lazy = false, -- neo-tree will lazily load itself
	config = function()
		require("neo-tree").setup({
			window = {
				position = "left",
				width = 30, -- Change this value to your preferred width
			}
		})

		vim.keymap.set('n', '<C-n>', ":Neotree filesystem toggle left<CR>", {})
		vim.keymap.set('n', '<C-m>', ":Neotree buffers reveal<CR>", {})

	end
}
