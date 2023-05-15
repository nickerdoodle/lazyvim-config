-- LSP keymaps
return {
  "nvim-neo-tree/neo-tree.nvim",
  -- these are added to which-key
  keys = {
    {
      "<leader>fe",
      function()
        -- toggle command
        require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
    {
      "<leader>fE",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    -- mapping keys to previously declared functions
    { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
    { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
  },
  opts = {
    window = {
      mappings = {
        ["w"] = "close_all_nodes", -- close all folders
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false, -- show hidden files
        hide_gitignored = false,
      },
    },
  },
}
