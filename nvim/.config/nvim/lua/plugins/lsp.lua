-- No nvim-lspconfig needed — Neovim 0.11+ has native LSP config support.
-- pyright server config lives in lsp/pyright.lua and is loaded by vim.lsp.enable().
return {
  "hrsh7th/cmp-nvim-lsp",
  ft = { "python" },
  config = function()
    -- Advertise nvim-cmp completion capabilities to all LSP servers
    vim.lsp.config('*', {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })

    -- Activate pyright (reads lsp/pyright.lua automatically)
    vim.lsp.enable('pyright')

    -- Keybindings applied when any LSP server attaches to a buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local buf = args.buf
        local map = function(lhs, rhs)
          vim.keymap.set("n", lhs, rhs, { buffer = buf, noremap = true, silent = true })
        end

        map("gd",         vim.lsp.buf.definition)           -- go to definition
        map("gr",         vim.lsp.buf.references)           -- find all references
        map("<leader>h",  vim.lsp.buf.hover)                -- hover docs
        map("<leader>H",  function()                        -- peek definition in vsplit
          vim.cmd("vsplit")
          vim.lsp.buf.definition()
        end)
        map("<leader>rn", vim.lsp.buf.rename)               -- rename symbol
        map("<leader>ca", vim.lsp.buf.code_action)          -- code actions
        map("[d",         vim.diagnostic.goto_prev)         -- previous diagnostic
        map("]d",         vim.diagnostic.goto_next)         -- next diagnostic
      end,
    })

    vim.diagnostic.config({
      signs = true,
      underline = true,
      virtual_text = true,
    })
  end,
}
