return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),       -- manually trigger completion
        ["<CR>"]      = cmp.mapping.confirm({ select = true }), -- confirm selection
        ["<Tab>"]     = cmp.mapping.select_next_item(),         -- next item
        ["<S-Tab>"]   = cmp.mapping.select_prev_item(),         -- prev item
        ["<C-e>"]     = cmp.mapping.abort(),                    -- close popup
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
      }),
    })
  end,
}
