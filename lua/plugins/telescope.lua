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
          layout_strategy = 'horizontal', -- horizontal, vertical, flex
          sorting_strategy = 'ascending',
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
            },
            width = 0.7,
            height = 0.7,
            -- preview_height = 0.5,
            -- preview_cutoff = 120,
          },
          prompt_prefix = "🔍 ",
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

