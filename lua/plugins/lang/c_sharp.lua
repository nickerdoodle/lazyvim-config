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
    -- opts = { ensure_installed = { "omnisharp", "netcoredbg" } },
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
        -- omnisharp = {
        --   handlers = {
        --     ["textDocument/definition"] = function(...)
        --       return require("omnisharp_extended").handler(...)
        --     end,
        --   },
        --   -- for now, omnisharp is working fine with the fzflua lsp apis, so if it's ever an issue, then, perhaps these can be reused
        --   -- keys = {
        --   --   {
        --   --     "gd",
        --   --     -- LazyVim.has("telescope.nvim") and function()
        --   --     --   require("omnisharp_extended").telescope_lsp_definitions()
        --   --     -- end or function()
        --   --     --   require("omnisharp_extended").lsp_definitions()
        --   --     -- end,
        --   --     take this big function with a grain of salt. chatgpt spat it out for me. better to go off the lazyvim docs
        --   --     function()
        --   --       local fzf_lua = require("fzf-lua")
        --   --       local omni_ext = require("omnisharp_extended")
        --   --
        --   --       -- Fetch OmniSharp extended definitions
        --   --       -- omni_ext.lsp_definitions()
        --   --       omni_ext.lsp_definitions(function(err, results, ctx, _)
        --   --         if err then
        --   --           vim.notify("Error fetching definitions: " .. err.message, vim.log.levels.ERROR)
        --   --           return
        --   --         end
        --   --         if not results or vim.tbl_isempty(results) then
        --   --           vim.notify("No definitions found", vim.log.levels.WARN)
        --   --           return
        --   --         end
        --   --
        --   --         -- Convert LSP locations to a format fzf-lua understands
        --   --         local locations = vim.lsp.util.locations_to_items(results, ctx.client_id)
        --   --         print(locations)
        --   --
        --   --         -- Use fzf-lua to present a picker
        --   --         fzf_lua.fzf_exec(locations, {
        --   --           prompt = "OmniSharp Definitions> ",
        --   --           actions = {
        --   --             ["default"] = function(selected)
        --   --               local entry = selected[1]
        --   --               if entry then
        --   --                 vim.cmd("e " .. entry.filename)
        --   --                 vim.api.nvim_win_set_cursor(0, { entry.lnum, entry.col - 1 })
        --   --               end
        --   --             end,
        --   --           },
        --   --         })
        --   --       end)
        --   --     end,
        --   --     desc = "Goto Definition",
        --   --   },
        --   --   {
        --   --     "gD",
        --   --     require("omnisharp_extended").lsp_type_definition(),
        --   --     desc = "Goto Type Definition",
        --   --   },
        --   --   {
        --   --     "gr",
        --   --     -- LazyVim.has("telescope.nvim") and function()
        --   --     --   require("omnisharp_extended").telescope_lsp_definitions()
        --   --     -- end or function()
        --   --     --   require("omnisharp_extended").lsp_definitions()
        --   --     -- end,
        --   --     function()
        --   --       local fzf_lua = require("fzf-lua")
        --   --       local omni_ext = require("omnisharp_extended")
        --   --
        --   --       -- Fetch OmniSharp extended definitions
        --   --       -- omni_ext.lsp_definitions()
        --   --       omni_ext.lsp_references(function(err, results, ctx, _)
        --   --         if err then
        --   --           vim.notify("Error fetching References: " .. err.message, vim.log.levels.ERROR)
        --   --           return
        --   --         end
        --   --         if not results or vim.tbl_isempty(results) then
        --   --           vim.notify("No References found", vim.log.levels.WARN)
        --   --           return
        --   --         end
        --   --
        --   --         -- Convert LSP locations to a format fzf-lua understands
        --   --         local locations = vim.lsp.util.locations_to_items(results, ctx.client_id)
        --   --
        --   --         -- Use fzf-lua to present a picker
        --   --         fzf_lua.fzf_exec(locations, {
        --   --           prompt = "OmniSharp References> ",
        --   --           actions = {
        --   --             ["default"] = function(selected)
        --   --               local entry = selected[1]
        --   --               if entry then
        --   --                 vim.cmd("e " .. entry.filename)
        --   --                 vim.api.nvim_win_set_cursor(0, { entry.lnum, entry.col - 1 })
        --   --               end
        --   --             end,
        --   --           },
        --   --         })
        --   --       end)
        --   --     end,
        --   --     desc = "Goto References",
        --   --   },
        --   --   -- {
        --   --   --   "gr",
        --   --   --   LazyVim.has("telescope.nvim") and function()
        --   --   --     require("omnisharp_extended").telescope_lsp_references()
        --   --   --   end or function()
        --   --   --     require("omnisharp_extended").lsp_references()
        --   --   --   end,
        --   --   --   desc = "Goto References",
        --   --   -- },
        --   --   {
        --   --     "gi",
        --   --     require("omnisharp_extended").lsp_implementation(),
        --   --     desc = "Goto Implementation",
        --   --   },
        --   -- },
        --   enable_roslyn_analyzers = true,
        --   organize_imports_on_format = false,
        --   enable_import_completion = true,
        -- },
      },
    },
  },
}
-- ---------------------------------------------------------------------------------------------------------------------------
-- OLD SET UP AS OF 2/21/25
--
-- ---------------------------------------------------------------------------------------------------------------------------
-- local util = require("util")
--
-- return {
--
--   -- Add C# to treesitter
--   {
--     "nvim-treesitter/nvim-treesitter",
--     opts = function(_, opts)
--       if type(opts.ensure_installed) == "table" then
--         util.list_insert_unique(opts.ensure_installed, "c_sharp")
--       end
--     end,
--   },
--
--   -- Correctly setup lspconfig for C# 🚀
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         -- Ensure mason installs the server
--         omnisharp = {},
--       },
--       -- configure omnisharp to fix the semantic tokens bug (really annoying)
--       setup = {
--         omnisharp = function(_, _)
--           ---@param input string
--           ---@return string
--           local function toCamelCase(input)
--             local words = {} ---@type string[]
--             local sanitized_input = input:gsub("[^%w%s]", " ")
--             for word in sanitized_input:gmatch("%S+") do
--               table.insert(words, word:lower())
--             end
--
--             for i = 2, #words do
--               words[i] = words[i]:gsub("^%l", string.upper)
--             end
--
--             return table.concat(words)
--           end
--
--           require("lazyvim.util").on_attach(function(client, _) ---@param client lspconfig.options.omnisharp
--             if client.name == "omnisharp" then
--               local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers ---@type string[]
--               for i, v in ipairs(tokenModifiers) do
--                 if v:match(" name$") then
--                   tokenModifiers[i] = v:gsub(" name$", "")
--                 end
--                 tokenModifiers[i] = toCamelCase(tokenModifiers[i])
--               end
--
--               local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes ---@type string[]
--               for i, v in ipairs(tokenTypes) do
--                 if v:match(" name$") then
--                   tokenTypes[i] = v:gsub(" name$", "")
--                 end
--                 tokenTypes[i] = toCamelCase(tokenTypes[i])
--               end
--             end
--           end)
--           return false
--         end,
--       },
--     },
--   },
-- }
