local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = {
    "ts_ls",         -- TypeScript/JavaScript LSP
    "lua_ls",        -- Lua LSP
    "pyright",       -- Python LSP
  },
  automatic_installation = true,
})
