-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Leader key
vim.g.mapleader = " "

-- Escapes
vim.keymap.set("i", "jj", "<esc>", {})

-- Telescope
-- vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>", {})
-- vim.keymap.set("n", "<leader>bl", "<cmd>Telescope buffers<CR>", {})

-- FzfLua (faster alt to Telescope and default for LazyVim in v14)
vim.keymap.set("n", "<C-p>", "<cmd>FzfLua files<CR>", {})
vim.keymap.set("n", "<leader>bl", "<cmd>FzfLua buffers<CR>", {})

vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<cr>", {})
vim.keymap.set("n", ";", ":", {})

vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", {})
vim.keymap.set("n", "gD", "<cmd>FzfLua lsp_type_defs<CR>", {})
vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", {})
vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", {})
vim.keymap.set("n", "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>", {})

-- tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")
vim.keymap.set("n", "<M-t>", "<cmd>silent !tmux neww tmux-sessionizer -s 1<CR>")
vim.keymap.set("n", "<M-n>", "<cmd>silent !tmux neww tmux-sessionizer -s 2<CR>")
vim.keymap.set("n", "<M-s>", "<cmd>silent !tmux neww tmux-sessionizer -s 3<CR>")

-- for now, I prefer using these to navigate splits
-- vim.keymap.set("n", "<C-j>", "<CMD>cnext<CR>", {})
-- vim.keymap.set("n", "<C-k>", "<CMD>cprev<CR>", {})

vim.keymap.set("n", "ge", function()
  local diagnostics = vim.diagnostic.get(0) -- Get all diagnostics for the current buffer

  -- Filter out only errors
  local errors = vim.tbl_filter(function(d)
    return d.severity == vim.diagnostic.severity.ERROR
  end, diagnostics)

  -- Send errors to the quickfix list
  vim.fn.setqflist({}, "r", {
    title = "LSP Errors",
    items = vim.diagnostic.toqflist(errors),
  })
  -- vim.cmd("copen")
  local cur_win = vim.api.nvim_get_current_win() -- Save current window
  vim.cmd("copen") -- Open Quickfix list
  vim.api.nvim_set_current_win(cur_win) -- Restore focus to previous window
end, {})

-- Movement
vim.keymap.set("n", "J", "5jzz", {})
-- lsp override for K set in lspconfig.lua
vim.keymap.set("n", "K", "5kzz", {})

vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})

--Miscellaneous
----Move content right of cursor to new line and stay in normal mode
vim.keymap.set("n", "<leader>j", "i<CR><ESC>", {})

----------------------------------------
if vim.g.vscode then
  require("config.vscode.keymaps")
end
