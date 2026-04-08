return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    require("lualine").setup({
      sections = {
        lualine_c = {
          {
            "filename",
            path = 1,                                            -- relative path
            symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" },
          },
        },
      },
      tabline = {
        lualine_a = {
          {
            "buffers",
            buffers_color = {
              active   = { fg = "#e3c7fc", bg = "#1e1530", gui = "bold" },
              inactive = { fg = "#4a3c56", bg = "#09090d" },
            },
          },
        },
        lualine_z = { "tabs" },
      },
    })
  end,
}
