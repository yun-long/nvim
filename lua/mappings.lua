require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
-- map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- 
map({ "n", "t" }, "<A-i>", function()
    require("nvchad.term").toggle { pos = "float", id = "floatTerm", float_opts={
        row = 0.35,
        col = 0.25,
        width = 0.9,
        height = 0.4
    }}
end, { desc = "terminal toggle floating term" })

-- Debug mappings
map("n", "<leader>d", "", { desc = "Debug" })  -- Debug prefix

-- General debug mappings
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })

map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "Continue/Start Debug" })

map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "Step Into" })

map("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "Step Over" })

map("n", "<leader>dO", function()
  require("dap").step_out()
end, { desc = "Step Out" })

map("n", "<leader>dt", function()
  require("dapui").toggle()
end, { desc = "Toggle Debugger UI" })

map("n", "<leader>dr", function()
  require("dap").repl.toggle()
end, { desc = "Toggle REPL" })

map("n", "<leader>dl", function()
  require("dap").run_last()
end, { desc = "Run Last Debug Configuration" })

map("n", "<leader>dh", function()
  require("dap.ui.widgets").hover()
end, { desc = "Hover Variables" })

map("n", "<leader>dp", function()
  require("dap.ui.widgets").preview()
end, { desc = "Preview" })

map("n", "<leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end, { desc = "Show Frames" })

map("n", "<leader>ds", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end, { desc = "Show Scopes" })

-- Python specific debug mappings
map("n", "<leader>dpm", function()
  require("dap-python").test_method()
end, { desc = "Debug Python Method" })

map("n", "<leader>dpc", function()
  require("dap-python").test_class()
end, { desc = "Debug Python Class" })

