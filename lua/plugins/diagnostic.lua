return {
  "AstroNvim/astrocore",
  opts = function(_, opts)
    local autocmds = opts.autocmds or {}
    autocmds.curline_diagnostics = {
      {
        event = "LspAttach",
        desc = "Show diagnostics on current line as virtual text",
        callback = function(args)
          local ns = vim.api.nvim_create_namespace("CurlineDiag")
          vim.diagnostic.config({ virtual_text = false })
          vim.opt.updatetime = 100
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorMoved" }, {
            buffer = args.buf,
            callback = function()
              vim.api.nvim_buf_clear_namespace(args.buf, ns, 0, -1)
              if vim.api.nvim_get_mode().mode == "n" then
                local hi = { "Error", "Warn", "Info", "Hint" }
                local curline = vim.api.nvim_win_get_cursor(0)[1]
                local diagnostics = vim.diagnostic.get(args.buf, { lnum = curline - 1 })
                local virt_texts = { { (" "):rep(4) } }
                for _, diag in ipairs(diagnostics) do
                  virt_texts[#virt_texts + 1] = { diag.message, "Diagnostic" .. hi[diag.severity] }
                end
                if #virt_texts > 1 then
                  vim.api.nvim_buf_set_extmark(args.buf, ns, curline - 1, 0, {
                    virt_text = virt_texts,
                    hl_mode = "combine",
                  })
                end
              end
            end,
          })
        end,
      },
    }
    opts.autocmds = autocmds
  end,
}
