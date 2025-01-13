local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

-- Function to dynamically get the Python interpreter from the Conda environment
local function get_conda_python()
    local conda_prefix = os.getenv("CONDA_PREFIX") -- Get the active Conda environment
    if conda_prefix then
        return conda_prefix .. "/bin/python" -- Adjust for Windows: use `\\Scripts\\python.exe`
    else
        return "/usr/bin/python" -- Fallback Python interpreter
    end
end

dap.adapters.python = {
  type = "executable",
  command = get_conda_python(),
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = get_conda_python(),
  },
}

-- Configure all DAP-related signs
vim.fn.sign_define("DapBreakpoint", {
  text = "🛑",       -- Symbol for a breakpoint
  texthl = "DiagnosticSignError", -- Highlight group for the sign
  linehl = "",      -- Optional: Line highlight group
  numhl = ""        -- Optional: Number column highlight group
})

vim.fn.sign_define("DapBreakpointCondition", {
  text = "🔵",       -- Symbol for a conditional breakpoint
  texthl = "DiagnosticSignHint",
  linehl = "",
  numhl = ""
})

vim.fn.sign_define("DapLogPoint", {
  text = "📝",       -- Symbol for a log point
  texthl = "DiagnosticSignInfo",
  linehl = "",
  numhl = ""
})

vim.fn.sign_define("DapStopped", {
  text = "➡️",       -- Symbol for the current line where the debugger is stopped
  texthl = "DiagnosticSignWarn",
  linehl = "Visual", -- Highlights the line where the debugger is stopped
  numhl = ""
})

vim.fn.sign_define("DapBreakpointRejected", {
  text = "❌",       -- Symbol for a rejected breakpoint
  texthl = "DiagnosticSignError",
  linehl = "",
  numhl = ""
})

