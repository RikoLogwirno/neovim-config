return {
	"milanglacier/minuet-ai.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("minuet").setup({
			request_timeout = 300,
			provider = "openai_compatible",
			provider_options = {
				openai_compatible = {
					-- Local model on Docker Model Runner
					end_point = "http://127.0.0.1:12434/engines/v1/chat/completions",
					-- The model name, check docker model runner for full name
					model = "huggingface.co/bartowski/qwen2.5-coder-7b-instruct-gguf:Q4_K_M",
					stream = false,
					api_key = function()
						return "NONE"
					end,
					optional = {
						max_tokens = 512,
					},
				},
			},
		})
	end,
}
