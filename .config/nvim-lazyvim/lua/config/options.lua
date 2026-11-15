-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.g.ai_cmp = false
vim.g.autoformat = false
vim.g.lazyvim_check_order = false

vim.opt.relativenumber = false
vim.opt.number = true

-- Performance optimizations
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
