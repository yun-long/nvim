require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    renderer = {
      highlight_opened_files = "all",
    },
  })

-- File Explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
