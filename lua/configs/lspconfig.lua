-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "pyright", }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Helper function to dynamically resolve the Python path for Conda environments
local function get_conda_python_path()
    -- Use Conda's CLI to fetch environment information
    local handle = io.popen("conda info --json")
    if handle then
        local result = handle:read("*a")
        handle:close()
        local conda_info = vim.fn.json_decode(result)
        if conda_info and conda_info.default_prefix then
            local python_path = conda_info.default_prefix .. "/bin/python"
            if vim.fn.executable(python_path) == 1 then
                print("Detected Conda Python path: " .. python_path)
                return python_path
            end
        end
    end
    -- Fallback path if Conda information is unavailable
    local fallback = "/path/to/anaconda/bin/python"
    print("Using fallback Python path: " .. fallback)
    return fallback
end

-- Configure Pyright for Python development
lspconfig.pyright.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    settings = {
        python = {
            pythonPath = get_conda_python_path(), -- Set Python path dynamically
            analysis = {
                typeCheckingMode = "basic", -- Strict type checking
                autoSearchPaths = true, -- Automatically search paths for modules
                useLibraryCodeForTypes = true, -- Use library code for type checking
            },
        },
    },
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
