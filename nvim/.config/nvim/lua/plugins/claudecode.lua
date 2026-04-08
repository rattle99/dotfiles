return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = function()
    require("claudecode").setup({
      terminal = {
        snacks_win_opts = {
          wo = {
            winhighlight = "Normal:Normal,NormalFloat:Normal",
          },
        },
      },
    })

    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
    end

    map("n", "<leader>lc", "<cmd>ClaudeCode<CR>", "Toggle Claude Code")
    map("n", "<leader>lf", "<cmd>ClaudeCodeFocus<CR>", "Focus Claude Code")
    map("v", "<leader>ls", "<cmd>ClaudeCodeSend<CR>", "Send selection to Claude")
    map("n", "<leader>la", "<cmd>ClaudeCodeDiffAccept<CR>", "Accept diff")
    map("n", "<leader>ld", "<cmd>ClaudeCodeDiffDeny<CR>", "Reject diff")
  end,
}
