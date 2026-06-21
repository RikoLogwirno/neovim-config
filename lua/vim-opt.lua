vim.env.PATH = "/opt/homebrew/bin:" .. vim.env.PATH

vim.cmd("syntax enable")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set cursorline")
vim.cmd("set termguicolors")
vim.cmd("highlight LineNr guifg=#6A98BC guibg=NONE")
vim.g.mapleader = " "

vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight NonText guibg=NONE ctermbg=NONE")
vim.cmd("highlight SignColumn guibg=NONE ctermbg=NONE")
vim.cmd("highlight EndOfBuffer guibg=NONE ctermbg=NONE")

vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- To make vim copy paste work with normal ctrl+c/v
vim.opt.clipboard = "unnamedplus"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Auto-close standard brackets and quotes, then move cursor left
vim.keymap.set("i", "(", "()<Left>")
vim.keymap.set("i", "[", "[]<Left>")
vim.keymap.set("i", "{", "{}<Left>")
vim.keymap.set("i", '"', '""<Left>')
vim.keymap.set("i", "'", "''<Left>")

-- Intelligent multi-line behavior for curly braces
vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O")

-- Normal Mode: Tekan Ctrl+Space untuk masuk Visual Mode dan langsung pilih node luar (parent)
vim.keymap.set("n", "<C-space>", "van", { remap = true, desc = "TS: Mulai seleksi inkremental" })

-- Visual Mode: Tekan Ctrl+Space untuk memperluas seleksi ke luar (parent node)
vim.keymap.set("x", "<C-space>", "an", { remap = true, desc = "TS: Perluas seleksi" })

-- Visual Mode: Tekan Backspace untuk mengecilkan seleksi ke dalam (child node)
vim.keymap.set("x", "<BS>", "in", { remap = true, desc = "TS: Kecilkan seleksi" })

vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		require("mini.map").open()
	end,
})

vim.api.nvim_set_hl(0, "BlinkCmpGhostText", {
    fg = "#7f849c",
})

-- Pastikan gopls terkonfigurasi dengan benar di Neovim 0.12
vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.work', 'go.mod', '.git' },
})

-- Aktifkan secara eksplisit agar gopls otomatis melampirkan diri ke file Go
vim.lsp.enable('gopls')
