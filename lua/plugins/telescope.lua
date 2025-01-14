return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require("telescope").setup({
        defaults = {
          -- Add your default settings here
          layout_strategy = 'vertical',
          layout_config = {
            vertical = {
              width = 0.8,
              height = 0.9,
              preview_height = 0.5,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                    -- Enable fuzzy searching
            override_generic_sorter = true,  -- Override the generic sorter
            override_file_sorter = true,     -- Override the file sorter
          },
        },
      })
      -- Load FZF extension
      require("telescope").load_extension("fzf")
    end,
    }
  }
