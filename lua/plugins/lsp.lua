-- Import the lspconfig module for configuring language servers
local lspconfig = require("lspconfig")

-- Configure TypeScript/JavaScript LSP server
lspconfig.ts_ls.setup {}

-- Configure Lua LSP server with custom settings
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- Recognize 'vim' as a global variable
      },
    },
  },
}

-- Configure Markdown LSP server
lspconfig.marksman.setup {}

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
    on_attach = function(client, bufnr)
        -- Define key mappings for LSP features
        local opts = { noremap = true, silent = true }
        local buf_set_keymap = vim.api.nvim_buf_set_keymap
        buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- Go to definition
        buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- Show hover info
        buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- Go to implementation
        buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- Rename symbol
        buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- Show code actions
    end,
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

-- Setup formatting with 'conform'
require("conform").setup({
    formatters_by_ft = {
        -- Add formatters per file type here
    }
})

-- Setup capabilities for autocompletion
local cmp = require('cmp')
local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities()
)

-- Setup UI for LSP with fidget and mason
require("fidget").setup({}) -- Show LSP progress

-- Configure autocompletion with nvim-cmp
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For snippet support
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), -- Navigate to previous item
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select), -- Navigate to next item
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- LSP source
        { name = 'luasnip' }, -- Snippet source
    }, {
        { name = 'buffer' }, -- Buffer source
    })
})


