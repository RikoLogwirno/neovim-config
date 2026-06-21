return {
	"olimorris/codecompanion.nvim",
	version = "^19.0.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {},
	config = function()
		require("codecompanion").setup({
			strategies = {
				chat = { adapter = "docker_model" },
				inline = { adapter = "docker_model" },
			},
			adapters = {
				http = {
					docker_model = function()
						return require("codecompanion.adapters").extend("openai_compatible", {
							env = {
								api_key = "NONE",
								-- Docker model runner host base url
								url = "http://127.0.0.1:12434",
							},
							schema = {
								model = {
									-- Model name on docker model runner, check docker for full name
									default = "huggingface.co/bartowski/qwen2.5-coder-7b-instruct-gguf:Q4_K_M",
								},
							},
						})
					end,
				},
			},
		})
	end,
	keys = {
		{ "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "AI Chat Toggle", mode = { "n", "v" } },
		{ "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "AI Inline Prompt", mode = { "n", "v" } },
		{ "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "AI Actions", mode = { "n", "v" } },
	},
}
