-- vscode_keymaps.lua
-- This file contains key mappings that are specifically applied when running Neovim inside VSCode.
-- You can tailor these mappings to avoid conflicts with VSCode's built-in shortcuts.

-- Define a helper function for setting key mappings
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Example mappings:

-- Save file in both normal and insert modes using Ctrl-s.
-- (VSCode usually reserves Ctrl-s for saving, but this helps keep the experience consistent.)
map("n", "<C-s>", ":w<CR>")
map("i", "<C-s>", "<Esc>:w<CR>a")

-- Close the current buffer with Ctrl-q.
map("n", "<C-q>", ":bdelete<CR>")

-- Open the integrated terminal (if desired) with Ctrl-`
map("n", "<C-`>", ":terminal<CR>")

-- Additional VSCode-specific keybindings:
-- For example, if you want to remap some navigation keys to not conflict with VSCode's built-in shortcuts.
-- Feel free to adjust these or add new ones as needed.

-- If VSCode already reserves certain keys you might want to avoid or modify them.
-- You can also load mappings that only make sense in the context of VSCode.

-- Optional: Provide a command to show a quick help for your VSCode mappings.
vim.cmd [[
  command! VSCodeKeymapHelp echo "VSCode key mappings loaded: <C-s> for save, <C-q> for close, etc."
]]

