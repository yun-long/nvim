require("Comment").setup({
    padding = true,
    sticky = true,
    mappings = {
      basic = true,
      extra = true,
    },
  })

-- Comment.nvim
map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
