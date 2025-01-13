local dap_python = require('dap-python')

-- Function to dynamically get the Python interpreter from the Conda environment
local function get_conda_python()
    local conda_prefix = os.getenv("CONDA_PREFIX") -- Get the active Conda environment
    if conda_prefix then
        return conda_prefix .. "/bin/python" -- Adjust for Windows: use `\\Scripts\\python.exe`
    else
        return "/usr/bin/python" -- Fallback Python interpreter
    end
end

-- Setup dap-python with the dynamic interpreter
dap_python.setup(get_conda_python())

