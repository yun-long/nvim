-- Import Telescope plugin
local telescope = require("telescope")


-- Custom Telescope configuration
telescope.setup {
  defaults = {
    -- Default settings
    prompt_prefix = "🔍 ",
    selection_caret = "➜ ",
    sorting_strategy = "ascending",
    layout_strategy = "vertical", -- Change to vertical layout
    layout_config = {
      vertical = {
        width = 0.9,
        height = 0.85,
        preview_cutoff = 25, -- Adjust preview window
      },
      horizontal = {
        preview_width = 0.6,
      },
    },
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },
  extensions_list = { "themes", "terms" },
  extensions = {},
}

return telescope

