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


vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function() 
		require('mini.map').open()
	end,
})
