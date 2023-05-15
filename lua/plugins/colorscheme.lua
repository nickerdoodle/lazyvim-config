-- source: https://www.lazyvim.org/plugins/colorscheme
return {
  -- add vscode
  { "Mofiqul/vscode.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
