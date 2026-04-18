-- -- Options are automatically loaded before lazy.nvim startup
-- -- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- -- Add any additional options here
vim.opt.autochdir = false -- Don't automatically change directories based on what file you're in

-- Enable the cfilter plugin, allows to filter quickfix/location lists using :CFilter(!) {pattern} / :LFilter(!) {pattern}
vim.cmd.packadd("cfilter")
