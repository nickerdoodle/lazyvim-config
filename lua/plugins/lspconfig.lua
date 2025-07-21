-- LSP keymaps
return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    -- keys[#keys + 1] = { "K", "5k" }
    -- disable a keymap (disable K -> vim.lsp.buf.hover())
    keys[#keys + 1] = { "K", false }
    -- add a keymap
    keys[#keys + 1] = { "<leader>k", "<cmd>lua vim.lsp.buf.hover()<cr>" }
  end,
  opts = {
    diagnostics = {
      virtual_text = {
        severity = vim.diagnostic.severity.ERROR, -- Only show virtual text for errors
      },
      -- signs = true, -- Keep signs in the sign column
      underline = true, -- Keep underlines for all diagnostics
      update_in_insert = false, -- Don't show diagnostics while typing
      severity_sort = true,
    },
  },
}
