return {
  "nvim-mini/mini.pairs",
  event = "VeryLazy",
  opts = function()
    -- Disable mini.pairs when executing from :normal commands
    vim.api.nvim_create_autocmd("CmdlineEnter", {
      pattern = ":",
      callback = function()
        vim.b.minipairs_disable = true
      end,
    })

    vim.api.nvim_create_autocmd("CmdlineLeave", {
      pattern = ":",
      callback = function()
        -- Re-enable after a short delay to ensure :norm commands complete
        vim.defer_fn(function()
          vim.b.minipairs_disable = false
        end, 100)
      end,
    })

    return {
      modes = { insert = true, command = false, terminal = false },
    }
  end,
}
