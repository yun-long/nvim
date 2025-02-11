return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- Attempt to load the catppuccin module
      local status_ok, catppuccin = pcall(require, "catppuccin")
      if not status_ok then
        vim.notify("Catppuccin plugin not found!", vim.log.levels.ERROR)
        return
      end

      catppuccin.setup({
        flavour = "macchiato", -- Choose your flavour: "latte", "frappe", "macchiato", or "mocha"
        custom_highlights = function(cp)
          return {
            -- Active tab in the tabline, with style as a table
            TabLineSel = {
              fg = cp.rosewater,
              bg = cp.surface0,
              style = { "bold" },
            },
            -- Inactive tabs in the tabline
            TabLine = {
              fg = cp.text,
              bg = cp.mantle,
            },
            -- Tabline fill background
            TabLineFill = {
              fg = cp.overlay2,
              bg = cp.base,
            },
            -- Window separator (edges)
            WinSeparator = {
              fg = cp.rosewater,
            },

            -- Normal = { bg="none" },
            -- FloatBorder = { fg = cp.base, bg = cp.base },
          }
        end,
      })

      -- Apply the colorscheme
      vim.cmd("colorscheme catppuccin")
    end,
  },
}

