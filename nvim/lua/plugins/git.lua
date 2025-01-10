vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "GitGutterAdd" })
vim.api.nvim_set_hl(0, "GitSignsChange", { link = "GitGutterChange" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { link = "GitGutterDelete" })

require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
  },
})

