local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- File Explorer
  { "nvim-tree/nvim-tree.lua", config = function() require("plugins.tree") end },

  -- Commenting
  { "numToStr/Comment.nvim", config = function() require("plugins.comment") end },

  -- UI Enhancements
  { "nvim-lualine/lualine.nvim", config = function() require("plugins.ui") end },
  { "Mofiqul/dracula.nvim", config = function() require("plugins.dracula") end },

  -- Development Tools
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "hrsh7th/nvim-compe" },

  -- Github Copilot
  { "github/copilot.vim" },

  -- Debugging tools (DAP)
  { "mfussenegger/nvim-dap", config = function() require("plugins.dap") end },
  { "rcarriga/nvim-dap-ui" },
  { "mfussenegger/nvim-dap-python" },
  { "nvim-neotest/nvim-nio" },

  -- Git
  { "lewis6991/gitsigns.nvim", config = function() require("plugins.git") end },

  -- lsp & mason & mason-lspconfig
  { "neovim/nvim-lspconfig",
    dependencies = {
          "stevearc/conform.nvim",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-cmdline",
          "hrsh7th/nvim-cmp",
          "L3MON4D3/LuaSnip",
          "saadparwaiz1/cmp_luasnip",
          "j-hui/fidget.nvim",
      },
    config = function() require("plugins.lsp") end },
  { "williamboman/mason.nvim", config = function() require("plugins.mason") end },
  { "williamboman/mason-lspconfig", config = function() require("plugins.mason_lspconfig") end },

  -- latex
  { "lervag/vimtex" },

  -- FZF search 
  { "ibhagwan/fzf-lua", config = function() require("plugins.fzf") end },
  { "ThePrimeagen/harpoon", branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }, config = function() require("plugins.harpoon") end
  },
  { "mbbill/undotree", config = function() require("plugins.undotree") end },

  -- Other Plugins
  { "terryma/vim-multiple-cursors" },
  { "ap/vim-css-color" },
  { "lifepillar/pgsql.vim" },
  { "preservim/tagbar" },
  { "tc50cal/vim-terminal" }
})
