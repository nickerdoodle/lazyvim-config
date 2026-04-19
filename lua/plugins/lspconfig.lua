-- LSP keymaps
return {
  "neovim/nvim-lspconfig",
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
    servers = {
      ["*"] = {
        keys = {
          -- disable K keymap that does vim.lsp.buf.hover()
          { "K", false },
          -- disable gr -> FzfLua lsp_references (set by lazyvim fzf extra)
          { "gr", false },
          { "<leader>k", "<cmd>lua vim.lsp.buf.hover()<cr>", has = "hover" },
        },
      },
    },
  },
}
