return {
  "folke/which-key.nvim",
  keys = {
    { "<leader>?", "<cmd>WhichKey <leader><CR>", desc = "Keybinding help" },
  },
  config = function()
    local wk = require("which-key")

    wk.setup({
      triggers = {},   -- disable automatic popup entirely
    })

    -- Descriptive labels for the popup
    wk.add({
      { "<leader>f",  desc = "Find files" },
      { "<leader>g",  desc = "Live grep" },
      { "<leader>b",  desc = "Buffers" },
      { "<leader>e",  desc = "File tree" },
      { "<leader>w",  desc = "Save" },
      { "<leader>q",  desc = "Close buffer" },
      { "<leader>n",  desc = "Next buffer" },
      { "<leader>p",  desc = "Prev buffer" },
      { "<leader>h",  desc = "Hover docs" },
      { "<leader>H",  desc = "Peek definition" },
      { "<leader>rn", desc = "Rename symbol" },
      { "<leader>ca", desc = "Code action" },
      { "<leader>lc", desc = "Toggle Claude Code" },
      { "<leader>lf", desc = "Focus Claude Code" },
      { "<leader>ls", desc = "Send to Claude" },
      { "<leader>la", desc = "Accept diff" },
      { "<leader>ld", desc = "Reject diff" },
    })
  end,
}
