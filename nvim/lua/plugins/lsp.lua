local lspconfig = require("lspconfig")

-- Example LSP server setups
lspconfig.ts_ls.setup {}
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}
