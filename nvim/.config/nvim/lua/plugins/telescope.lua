return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",                -- compiles the fzf C sorter on install
    },
  },
  keys = {
    { "<leader>f", "<cmd>Telescope find_files<CR>" },  -- fuzzy find files
    { "<leader>g", "<cmd>Telescope live_grep<CR>" },   -- search text across files
    { "<leader>b", "<cmd>Telescope buffers<CR>" },     -- fuzzy search open buffers
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,   -- use fzf for all sorting
          override_file_sorter = true,
        },
      },
    })

    telescope.load_extension("fzf")
  end,
}
