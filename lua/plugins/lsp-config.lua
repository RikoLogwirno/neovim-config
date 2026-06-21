return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			-- 1. Inisialisasi Mason
			require("mason").setup()

			-- 2. Daftar Server yang dikelola Mason
			local mason_servers = {
				"lua_ls",
				"astro",
				"ts_ls",
				"yamlls",
				"html",
			}

			-- Server eksternal (diinstal via sistem/binary luar Mason)
			local system_servers = {
				"phpantom_lsp",
				"golangci_lint_ls",
				"golnangci_lint"
			}

			-- Gabungkan semua untuk otomatisasi instalasi alat tambahan jika ada
			local ensure_installed = vim.deepcopy(mason_servers)
			vim.list_extend(ensure_installed, {
				"stylua", -- Pemformat kode Lua
			})

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			-- 3. Fungsi utama konfigurasi native Neovim 0.12
			local function setup_server(server_name, opts)
				opts = opts or {}
				vim.lsp.config(server_name, opts)
				vim.lsp.enable(server_name)
			end

			-- 4. Konfigurasi Mason LSP Handlers (Sintaksis diperbaiki)
			require("mason-lspconfig").setup({
				handlers = {
					-- Fungsi pertama bertindak sebagai default handler untuk semua server Mason
					function(server_name)
						setup_server(server_name, {})
					end,
				},
			})

			-- 5. Konfigurasi Server Eksternal
			for _, server in ipairs(system_servers) do
				setup_server(server, {})
			end

			-- 6. Otomatisasi Keymaps saat LSP aktif
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }

					-- Keymaps bawaan Neovim 0.12: K (hover), grn (rename), gra (code action), grr (references)
					-- Tambahan keymaps kustom Anda:
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, opts)

					-- Format file
					vim.keymap.set("n", "<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})

			vim.diagnostic.config({
				virtual_text = false,
				virtual_lines = { only_current_line = true }
			})
		end,
	},
}
