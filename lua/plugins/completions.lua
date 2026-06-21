return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		version = "*",

		opts = {
			-- Pola tombol pintas (keymaps) bawaan yang intuitif
			keymap = {
				preset = "default",
				-- 'default' memetakan:
				-- <C-space> untuk memunculkan kotak saran secara manual
				-- <C-e> untuk menutup kotak saran
				-- <CR> (Enter) untuk memilih/menerima saran
				-- <Tab> dan <S-Tab> untuk memilih ke atas/bawah

				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},


			completion = {
				ghost_text = {
					enabled = true,
				},
			},

			-- Hubungkan ke sistem LSP native Neovim 0.12 yang sudah kita buat
			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
					"minuet",
				},

				providers = {
					minuet = {
						name = "minuet",
						module = "minuet.blink",
						score_offset = 100,
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
