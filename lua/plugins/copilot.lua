return {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  config = function () require("copilot_cmp").setup() end,
  dependencies = {
    "zbirenbaum/copilot.lua",
    config = function()
        require('copilot').setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right | horizontal | vertical
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          hide_during_completion = true,
          debounce = 75,
          keymap = {
            accept = "<C-x>",
            accept_word = false,
            accept_line = false,
            next = "<C+j>",
            prev = "<C+k>",
            dismiss = "<C-e>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
  end,
  },
  -- opts = function(_, opts)
  --       local cmp, copilot = require "cmp", require "copilot.suggestion"
  --       local snip_status_ok, luasnip = pcall(require, "luasnip")
  --       if not snip_status_ok then return end
  --       local function has_words_before()
  --         local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --         return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
  --       end
  --       if not opts.mapping then opts.mapping = {} end
  --       opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
  --         if copilot.is_visible() then
  --           copilot.accept()
  --         elseif cmp.visible() then
  --           cmp.select_next_item()
  --         elseif luasnip.expand_or_jumpable() then
  --           luasnip.expand_or_jump()
  --         elseif has_words_before() then
  --           cmp.complete()
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" })
  --
  --       opts.mapping["<C-x>"] = cmp.mapping(function()
  --         if copilot.is_visible() then copilot.next() end
  --       end)
  --
  --       opts.mapping["<C-z>"] = cmp.mapping(function()
  --         if copilot.is_visible() then copilot.prev() end
  --       end)
  --
  --       opts.mapping["<C-right>"] = cmp.mapping(function()
  --         if copilot.is_visible() then copilot.accept_word() end
  --       end)
  --
  --       opts.mapping["<C-l>"] = cmp.mapping(function()
  --         if copilot.is_visible() then copilot.accept_word() end
  --       end)
  --
  --       opts.mapping["<C-down>"] = cmp.mapping(function()
  --         if copilot.is_visible() then copilot.accept_line() end
  --       end)
  --
  --       opts.mapping["<C-j>"] = cmp.mapping(function()
  --         if copilot.is_visible() then copilot.accept_line() end
  --       end)
  --
  --       opts.mapping["<C-c>"] = cmp.mapping(function()
  --         if copilot.is_visible() then copilot.dismiss() end
  --       end)
  --
  --       return opts
  --   end,
}

