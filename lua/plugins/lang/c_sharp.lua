return {
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      -- your configuration comes here; leave empty for default settings
    },
  },
  { "Hoffs/omnisharp-extended-lsp.nvim", lazy = true },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "c_sharp" } },
  },
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "netcoredbg" } },
  },
  -- {
  --   "which-key",
  --   keys = {
  --     { "gi", false },
  --   },
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = false,
      },
    },
  },
}
