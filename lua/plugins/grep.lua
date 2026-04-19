return {
  {
    "ibhagwan/fzf-lua",
  --         Problem: After upgrading Neovim from 0.11.5 to 0.12.1, running :Lazy update caused nvim to silently exit ~1 second after opening (dashboard would flash then
  -- close).
  --
  -- Root cause: nvim-treesitter was completely rewritten for Neovim 0.12. The old master branch is frozen/archived, and the new main branch has a different API.
  -- While your lock file already pointed to the main branch, the old compiled parsers on disk were incompatible with the new plugin version, causing a silent crash
  -- on startup.
  --
  -- Solution:
  -- 1. Updated nvim-treesitter and nvim-treesitter-textobjects to latest
  -- 2-3a.(What I used)
    -- (Here's what I used)
    --   nvim --headless +'Lazy update nvim-treesitter nvim-treesitter-textobjects' +qa
    -- nvim --headless +'TSUninstall all' +qa
    -- nvim --headless +'TSUpdate' +qa
  -- 2b. Removed old compiled parsers: rm -rf ~/.local/share/nvim/site/parser
  -- 3b. Rebuilt all parsers: nvim --headless +'TSUpdate' +qa
  --
  -- Sources:
  -- - https://www.qu8n.com/posts/treesitter-migration-guide-for-nvim-0-12
  -- - https://github.com/nvim-treesitter/nvim-treesitter/issues/8636
  -- - https://github.com/nvim-treesitter/nvim-treesitter/issues/8497
  -- - https://dotfiles.substack.com/p/whats-new-in-neovim-012


    keys = {
      {
        "<leader>ff",
        function()
          local cword = vim.fn.expand("<cword>")
          require("fzf-lua").live_grep({ search = cword })
        end,
        desc = "Search cword with live grep",
      },
      {
        "<leader>ff",
        mode = "v",
        function()
          -- Yank the selection to register "v
          vim.cmd('normal! "vy')
          local text = vim.fn.getreg("v")
          require("fzf-lua").live_grep({ search = text })
        end,
        desc = "Search visual selection with live grep",
      },
    },
    -- this whole opts block is copied from lazyvim docs except for overriding one line
    opts = function(_, opts)
      local fzf = require("fzf-lua")
      local config = fzf.config
      local actions = fzf.actions

      -- Quickfix
      config.defaults.keymap.fzf["ctrl-q"] = "select-all+accept"
      config.defaults.keymap.fzf["ctrl-u"] = "half-page-up"
      config.defaults.keymap.fzf["ctrl-d"] = "half-page-down"
      config.defaults.keymap.fzf["ctrl-x"] = "jump"
      config.defaults.keymap.fzf["ctrl-f"] = "preview-page-down"
      config.defaults.keymap.fzf["ctrl-b"] = "preview-page-up"
      config.defaults.keymap.builtin["<c-f>"] = "preview-page-down"
      config.defaults.keymap.builtin["<c-b>"] = "preview-page-up"

      -- Trouble
      if LazyVim.has("trouble.nvim") then
        config.defaults.actions.files["ctrl-t"] = require("trouble.sources.fzf").actions.open
      end

      -- Toggle root dir / cwd
      config.defaults.actions.files["ctrl-r"] = function(_, ctx)
        local o = vim.deepcopy(ctx.__call_opts)
        o.root = o.root == false
        o.cwd = nil
        o.buf = ctx.__CTX.bufnr
        LazyVim.pick.open(ctx.__INFO.cmd, o)
      end
      config.defaults.actions.files["alt-c"] = config.defaults.actions.files["ctrl-r"]
      config.set_action_helpstr(config.defaults.actions.files["ctrl-r"], "toggle-root-dir")

      local img_previewer ---@type string[]?
      for _, v in ipairs({
        { cmd = "ueberzug", args = {} },
        -- { cmd = "chafa", args = { "{file}", "--format=symbols" } },
        -- removed --format=symbols because that would make all images blurry
        -- I have chafa and viu installed but better to use chafa as viu displays images blurry in tmux and neovim
        { cmd = "chafa", args = { "{file}" } },
        -- don't allow viu
        -- { cmd = "viu", args = { "-b" } },
      }) do
        if vim.fn.executable(v.cmd) == 1 then
          img_previewer = vim.list_extend({ v.cmd }, v.args)
          break
        end
      end

      return {
        "default-title",
        fzf_colors = true,
        fzf_opts = {
          ["--no-scrollbar"] = true,
        },
        defaults = {
          -- formatter = "path.filename_first",
          formatter = "path.dirname_first",
        },
        previewers = {
          builtin = {
            extensions = {
              ["png"] = img_previewer,
              ["jpg"] = img_previewer,
              ["jpeg"] = img_previewer,
              ["gif"] = img_previewer,
              ["webp"] = img_previewer,
            },
            ueberzug_scaler = "fit_contain",
          },
        },
        -- Custom LazyVim option to configure vim.ui.select
        ui_select = function(fzf_opts, items)
          return vim.tbl_deep_extend("force", fzf_opts, {
            prompt = " ",
            winopts = {
              title = " " .. vim.trim((fzf_opts.prompt or "Select"):gsub("%s*:%s*$", "")) .. " ",
              title_pos = "center",
            },
          }, fzf_opts.kind == "codeaction" and {
            winopts = {
              layout = "vertical",
              -- height is number of items minus 15 lines for the preview, with a max of 80% screen height
              height = math.floor(math.min(vim.o.lines * 0.8 - 16, #items + 4) + 0.5) + 16,
              width = 0.5,
              preview = not vim.tbl_isempty(vim.lsp.get_clients({ bufnr = 0, name = "vtsls" })) and {
                layout = "vertical",
                vertical = "down:15,border-top",
                hidden = "hidden",
              } or {
                layout = "vertical",
                vertical = "down:15,border-top",
              },
            },
          } or {
            winopts = {
              width = 0.5,
              -- height is number of items, with a max of 80% screen height
              height = math.floor(math.min(vim.o.lines * 0.8, #items + 4) + 0.5),
            },
          })
        end,
        winopts = {
          width = 0.8,
          height = 0.8,
          row = 0.5,
          col = 0.5,
          preview = {
            scrollchars = { "┃", "" },
          },
        },
        files = {
          cwd_prompt = false,
          actions = {
            ["alt-i"] = { actions.toggle_ignore },
            ["alt-h"] = { actions.toggle_hidden },
          },
        },
        grep = {
          actions = {
            ["alt-i"] = { actions.toggle_ignore },
            ["alt-h"] = { actions.toggle_hidden },
          },
        },
        lsp = {
          symbols = {
            symbol_hl = function(s)
              return "TroubleIcon" .. s
            end,
            symbol_fmt = function(s)
              return s:lower() .. "\t"
            end,
            child_prefix = false,
          },
          code_actions = {
            previewer = vim.fn.executable("delta") == 1 and "codeaction_native" or nil,
          },
        },
      }
    end,
  },
}
