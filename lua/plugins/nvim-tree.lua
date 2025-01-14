return {
  -- Add nvim-tree plugin
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Adds file icons
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30, -- Width of the tree view
          side = "left", -- Position: left or right
        },
        renderer = {
          highlight_opened_files = "name",
        },
        filters = {
          dotfiles = false, -- Show hidden files (dotfiles)
        },
      })
    end,
  },
}

