-- LSP keymaps
return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    keys[#keys + 1] = { "K", "5k" }
    -- disable a keymap
    -- keys[#keys + 1] = { "K", false }
    -- add a keymap
    -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
  end,
  keys = {
    {
      "<leader>lq",
      "<cmd>lua vim.lsp.buf.code_action()<CR>",
      desc = "Code actions",
      remap = true,
    },
  },
}
