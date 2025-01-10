vim.g.mapleader = " "

-- General
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true }) -- Quit
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true }) -- Save

-- Navigate buffers
vim.keymap.set('n', '<leader>bn', ':bn<CR>', { noremap = true, silent = true }) -- Next buffer
vim.keymap.set('n', '<leader>bp', ':bp<CR>', { noremap = true, silent = true }) -- Previous buffer
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true }) -- Delete buffer
vim.keymap.set('n', '<leader>bl', ':ls<CR>', { noremap = true, silent = true }) -- List buffers


-- Comment.nvim
map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
