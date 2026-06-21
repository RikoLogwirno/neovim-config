return {
	"nvim-mini/mini.map",
	version = "*",
	config = function()
		local map = require("mini.map")
		map.setup({
			integrations = {
				map.gen_integration.builtin_search(),
				map.gen_integration.diagnostic(),
			},
			symbols = { encode = map.gen_encode_symbols.dot("4x2") },
			window = { side = "right", width = 20 },
		})
		vim.keymap.set("n", "<leader>mo", function()
			map.open()
		end, { desc = "Open Minimap" })
		vim.keymap.set("n", "<leader>mc", function()
			map.close()
		end, { desc = "Close Minimap" })
		vim.keymap.set("n", "<leader>mt", function()
			map.toggle()
		end, { desc = "Toggle Minimap" })
	end,
}
