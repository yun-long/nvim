return {
  -- Add nvim-tree plugin
  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      opts.signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      }
    end,
  },
}

