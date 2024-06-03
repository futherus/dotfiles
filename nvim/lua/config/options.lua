-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.autowrite = false              -- Disable auto write
opt.relativenumber = false         -- Disable relative line numbers
opt.scrolloff = 20                 -- Lines of context
opt.spelllang = { "en", "ru" }
opt.wildmode = "longest:full,full" -- Command-line completion mode

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.softtabstop = 4

vim.g.autoformat = false
