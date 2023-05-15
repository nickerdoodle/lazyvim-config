-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Leader key
vim.g.mapleader = " "

-- Escapes
vim.keymap.set("i", "jj", "<esc>", {})

-- Telescope
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>", {})
vim.keymap.set("n", "<leader>bl", "<cmd>Telescope buffers<CR>", {})

-- Directory tree
vim.keymap.set("n", "<C-b>", "<cmd>Neotree toggle<CR>", {})

vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<cr>", {})
vim.keymap.set("n", ";", ":", {})

-- Movement
vim.keymap.set("n", "J", "5j", {})
-- lsp override for K set in plugins/lsp.lua
vim.keymap.set("n", "K", "5k", {})

--Neotree
vim.keymap.set("n", "<C-e>", "<cmd>Neotree toggle filesystem<cr>", {})
-- couldn't get this to override
-- vim.keymap.set("n", "<C-b>", "<cmd>Neotree toggle filesystem<cr>", {})
