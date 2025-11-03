if vim.g.vscode then
  return {
    { "leap.nvim", enabled = false, vscode = false },
    { "flit.nvim", enabled = false, vscode = false },
    { "ggandor/leap.nvim", enabled = false, vscode = false },
    { "ggandor/flit.nvim", enabled = false, vscode = false },
    { "folke/flash.nvim", enabled = false, vscode = false },
    { "nvim-treesitter", enabled = false, vscode = true },
    { "nvim-treesitter-textobjects", enabled = false, vscode = true },
    { "nvim-ts-context-commentstring", enabled = false, vscode = false },
    { "nvim-telescope/telescope.nvim", enabled = false, vscode = false },
    -- name has changed
    -- { "williamboman/mason.nvim", enabled = false, vscode = false },
    { "mason-org/mason.nvim", enabled = false, vscode = false },
    { "Mofiqul/vscode.nvim", enabled = false, vscode = false },
    -- { "echasnovski/mini.indentscope", enabled = false, vscode = false },
    -- name has changed
    { "nvim-mini/mini.indentscope", enabled = false, vscode = false },
    { "lukas-reineke/indent-blankline.nvim", enabled = false, vscode = false },
  }
end

return {
  { "ggandor/leap.nvim", enabled = false },
  { "ggandor/flit.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
  -- { "nvimtools/none-ls.nvim", enabled = false },
  -- { "folke/noice.nvim", enabled = false },
}
