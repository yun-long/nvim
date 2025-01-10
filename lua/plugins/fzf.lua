-- FZF Lua key mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-P>', "<cmd>lua require('fzf-lua').files()<CR>", opts)
map('n', '<C-s-B>', "<cmd>lua require('fzf-lua').buffers()<CR>", opts)
map('n', '<C-f>', "<cmd>lua require('fzf-lua').live_grep()<CR>", opts)
map('n', '<C-A-f>', "<cmd>lua require('fzf-lua').grep_project()<CR>", opts)


