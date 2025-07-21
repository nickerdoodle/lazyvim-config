-- source: https://www.lazyvim.org/plugins/colorscheme
M = {
  { "Mofiqul/vscode.nvim" },
}

if not vim.g.vscode then
  table.insert(M, {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  })
end

return M
-- return {
--   -- add vscode
--   { "Mofiqul/vscode.nvim" },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "vscode",
--     },
--   },
-- }
