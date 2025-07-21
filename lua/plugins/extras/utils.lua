return {
  -- { "folke/noice.nvim", lsp = {
  --   hover = {
  --     enabled = false,
  --   },
  -- } },
  { "tpope/vim-repeat", vscode = true },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      keys[#keys + 1] = { "K", "5k" }
      -- disable a keymap
      -- keys[#keys + 1] = { "K", false }
      -- add a keymap
      -- keys[#keys + 1] = { "K", "5k" }
    end,
  },
}
