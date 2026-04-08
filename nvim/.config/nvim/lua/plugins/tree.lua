return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },   -- nerd font icons
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>" },        -- toggle file tree sidebar
  },
  config = function()
    require("nvim-tree").setup({
      renderer = {
        icons = {
          show = { git = true, file = true, folder = true },
        },
      },
      git = { enable = true },
    })
  end,
}
