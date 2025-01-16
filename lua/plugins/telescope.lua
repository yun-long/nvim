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
          sorting_strategy = 'ascending',
          layout_config = {
            vertical = {
              prompt_position = "top",
              width = 0.7,
              height = 0.4,
              preview_height = 0.4,
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

