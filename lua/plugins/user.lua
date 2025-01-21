-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:
---@type LazySpec
return {

  -- == Examples of Adding Plugins ==
  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      -- modify the sources part of the options table
      opts.sources = cmp.config.sources({
        { name = "copilot", priority = 1100 },
        { name = "nvim_lsp", priority = 1000 },
        -- { name = "luasnip", priority = 750 },
        -- { name = "buffer", priority = 500 },
        -- { name = "path", priority = 250 },
      })

      local lspkind = require("lspkind")
      lspkind.init({
        symbol_map = {
          Copilot = "",
        },
      })
      vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})
    end,
  },

  {
    -- override the togglerterm plugin, change the floating terminal size
    "akinsho/toggleterm.nvim",
    opts = function(_, opts)
      opts.float_opts = {
        border = 'curved',
        width = 100,
        height = 40,
        winblend = 0, -- disable transparency
      }
      opts.winbar = {
        enabled = false,
        name_formatter = function(term) --  term: Terminal
        return term.name
      end
      }
    end,
  }

}
