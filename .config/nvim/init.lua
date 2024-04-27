vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"
vim.o.autochdir = true
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
	"git",
	  "clone",
      "--filter=blob:none",
	  "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
		  lazypath,
})
    end
vim.opt.rtp:prepend(lazypath)
vim.o.termguicolors = true
require("lazy").setup("plugins")
require("settings")
require("keymappings")
require("lsp_configuration")
