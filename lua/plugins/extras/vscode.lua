---------------------------------------------------------
if not vim.g.vscode then
  return {}
end

return {
  -- "flit.nvim",
  { "lazy.nvim", vscode = true },
  -- { "leap.nvim", vscode = true },
  { "mini.ai", vscode = true },
  { "mini.comment", vscode = true },
  { "echasnovski/mini.pairs", version = "*", vscode = true },
  {
    "echasnovski/mini.surround",
    version = "*",
    vscode = true,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    vscode = true,
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  -- { "nvim-treesitter", vscode = false },
  -- { "nvim-treesitter-textobjects", vscode = false },
  -- { "nvim-ts-context-commentstring", vscode = false },
  { "ggandor/leap.nvim", enabled = false, vscode = false },
  { "ggandor/flit.nvim", enabled = false, vscode = false },
  { "folke/flash.nvim", enabled = false, vscode = false },
}
