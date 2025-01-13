-- Set the cache directory for base46 theme using Neovim's data directory
-- stdpath "data" returns the path to Neovim's data directory (usually ~/.local/share/nvim)
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"

-- Set the leader key to spacebar - this is used for custom keybindings
vim.g.mapleader = " "

-- Define the path where lazy.nvim (package manager) will be installed
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is already installed
-- vim.uv.fs_stat checks if the file/directory exists
if not vim.uv.fs_stat(lazypath) then
  -- If not installed, set the repository URL
  local repo = "https://github.com/folke/lazy.nvim.git"
  -- Clone the lazy.nvim repository
  -- --filter=blob:none optimizes the clone
  -- --branch=stable ensures we get the stable version
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

-- Add lazy.nvim to Neovim's runtime path (rtp)
-- This makes lazy.nvim available to Neovim
vim.opt.rtp:prepend(lazypath)

-- Load lazy.nvim configuration from configs/lazy.lua
local lazy_config = require "configs.lazy"

-- Initialize lazy.nvim with plugins
require("lazy").setup({
  -- Load NvChad as the base configuration
  {
    "NvChad/NvChad",     -- The plugin repository
    lazy = false,        -- Load immediately (don't lazy load)
    branch = "v2.5",     -- Use version 2.5
    import = "nvchad.plugins",  -- Import NvChad's default plugins
  },

  -- Import additional plugins from your plugins directory
  { import = "plugins" },
}, lazy_config)  -- Pass the lazy configuration we loaded earlier

-- Load the default theme from base46 cache
dofile(vim.g.base46_cache .. "defaults")
-- Load the statusline theme from base46 cache
dofile(vim.g.base46_cache .. "statusline")

-- Load general Neovim options from options.lua
require "options"
-- Load NvChad's automatic commands (autocmds)
require "nvchad.autocmds"

-- Schedule loading of keymappings for better startup performance
-- vim.schedule delays the execution until Neovim is less busy
vim.schedule(function()
  require "mappings"
end)

-- Load custom TeX configuration
require("custom.texpresso")

-- Load specific plugin configurations
require("configs.telescope")  -- Load Telescope (fuzzy finder) configuration
require("configs.cmp")       -- Load completion (nvim-cmp) configuration
