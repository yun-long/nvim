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
          -- ["<Leader>o"] = { "<cmd>NvimTreeFocus<CR>", desc = "Focus NvimTree" },
          ["<Leader>o"] = { "<cmd>NvimTreeFindFileToggle<CR>", desc = "Find File Toggle NvimTree" },

          -- ToggleTerm keymaps
          ["<Leader>tf"] = { "<cmd>1ToggleTerm direction=float<CR>", desc = "ToggleTerm float" },
          ["<Leader>th"] = { "<cmd>2ToggleTerm size=20 direction=horizontal<CR>", desc = "ToggleTerm horizontal split" },
          ["<Leader>tv"] = {
            function()
              local width = math.floor(vim.o.columns * 0.4)
              vim.cmd("3ToggleTerm size=" .. width .. " direction=vertical")
            end,
            desc = "ToggleTerm vertical split",
          },

          -- Window navigation
          ["<C-h>"] = { "<C-w>h", desc = "Move to left window" },
          ["<C-l>"] = { "<C-w>l", desc = "Move to right window" },
          ["<C-j>"] = { "<C-w>j", desc = "Move to lower window" },
          ["<C-k>"] = { "<C-w>k", desc = "Move to upper window" },

          -- Resize window with arrows
          ["<C-Up>"] = { "<cmd>resize +2<CR>", desc = "Resize window up" },
          ["<C-Down>"] = { "<cmd>resize -2<CR>", desc = "Resize window down" },
          ["<S-Left>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize window left" },
          ["<S-Right>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize window right" },

          -- Buffer navigation
          ["<S-l>"] = { "<cmd>bnext<CR>", desc = "Next buffer" },
          ["<S-h>"] = { "<cmd>bprevious<CR>", desc = "Previous buffer" },
          ["<leader>bx"] = { "<cmd>bdelete<CR>", desc = "Close current buffer" },

          -- Quick actions
          ["<Leader>w"] = { "<cmd>w<CR>", desc = "Save file" },
          ["<Leader>q"] = { "<cmd>q<CR>", desc = "Quit" },
          ["<Leader>qa"] = { "<cmd>qa<CR>", desc = "Quit all" },
          
        },
        t = {
          ["<C-h>"] = { "<C-\\><C-n><C-w>h", desc = "Move to left window" },
          ["<C-l>"] = { "<C-\\><C-n><C-w>l", desc = "Move to right window" },
          ["<C-j>"] = { "<C-\\><C-n><C-w>j", desc = "Move to lower window" },
          ["<C-k>"] = { "<C-\\><C-n><C-w>k", desc = "Move to upper window" },
        },

        v = {
          -- stay in indent mode
          ["<"] = { "<gv", desc = "Indent left" },
          [">"] = { ">gv", desc = "Indent right" },

          -- Better paste
          ["p"] = { '"_dP', desc = "Better paste" },
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
