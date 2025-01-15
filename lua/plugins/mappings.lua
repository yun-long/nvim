return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(function(bufnr)
                require("astrocore.buffer").close(bufnr)
              end)
            end,
            desc = "Pick to close",
          },
          -- tables with just a `desc` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<Leader>b"] = { desc = "Buffers" },
          -- quick save
          -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

          -- NvimTree key map
          ["<Leader>e"] = { "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
          ["<Leader>o"] = { "<cmd>NvimTreeFocus<CR>", desc = "Focus NvimTree" },

          -- ToggleTerm kep map 
          ["<Leader>tf"] = { "<cmd>ToggleTerm size=30 direction=float<CR>", desc = "ToggleTerm float" },
          ["<Leader>th"] = { "<cmd>ToggleTerm size=30 direction=horizontal<CR>", desc = "ToggleTerm horizontal split" },
          ["<Leader>tv"] = { "<cmd>ToggleTerm size=50 direction=vertical<CR>", desc = "ToggleTerm vertical split" },

          -- Resize window with arrows
          ["<C-Up>"] = { "<cmd>resize +2<CR>", desc = "Resize window up" },
          ["<C-Down>"] = { "<cmd>resize -2<CR>", desc = "Resize window down" },
          ["<C-Left>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize window left" },
          ["<C-Right>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize window right" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },

        v = {
          -- stay in indent mode
          ["<"] = { "<gv", desc = "Indent left" },
          [">"] = { ">gv", desc = "Indent right" },
        }
      },
    },
  },


  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function()
              vim.lsp.buf.hover()
            end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function()
              vim.lsp.buf.declaration()
            end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
