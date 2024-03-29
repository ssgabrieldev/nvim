vim.g.border_style = "single"
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",     -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.wo.wrap = false
vim.wo.number = true

vim.opt.mouse = ""
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.opt.splitright = true
vim.opt.smartindent = true
vim.opt.scrolloff = 5

vim.keymap.set('n', '<A-h>', ':vertical resize -2<cr>', { silent = true })
vim.keymap.set('n', '<A-l>', ':vertical resize +2<cr>', { silent = true })
vim.keymap.set('n', '<A-j>', ':resize -2<cr>', { silent = true })
vim.keymap.set('n', '<A-k>', ':resize +2<cr>', { silent = true })
vim.keymap.set('t', '<esc>', '<c-\\><c-n>', { silent = true })
