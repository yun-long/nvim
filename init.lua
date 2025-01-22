-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)


-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

-- Load your custom TeXpresso module
local texpresso = require("custom.texpresso")
-- Automatically attach TeXpresso when opening a TeX file
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    if not vim.b[buf].texpresso_attached then
      texpresso.attach(buf)
      vim.b[buf].texpresso_attached = true
    end
  end,
})

-- 

-- -- avante tab complete
-- vim.api.nvim_create_autocmd("User", {
--     pattern = "ToggleMyPrompt",
--     callback = function()
--         require("avante.config").override({ system_prompt = "MY CUSTOM SYSTEM PROMPT" })
--     end,
-- })
--
-- vim.keymap.set("n", "<leader>am", function()
--     vim.api.nvim_exec_autocmds("User", { pattern = "ToggleMyPrompt" })
-- end, { desc = "avante: toggle my prompt" })
--

vim.opt.colorcolumn = "80"
vim.opt.tabstop = 2         -- Number of spaces for a tab
vim.opt.shiftwidth = 2      -- Number of spaces for each indentation
vim.opt.softtabstop = 2     -- Number of spaces when pressing Tab
vim.opt.expandtab = true    -- Use spaces instead of tabs
 
require "lazy_setup"
require "polish"


