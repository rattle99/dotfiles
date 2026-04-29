return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local function hl(group, attr)
      local val = vim.api.nvim_get_hl(0, { name = group, link = false })[attr]
      return val and string.format("#%06x", val) or nil
    end

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
              active   = { fg = hl("Normal", "fg"),  bg = hl("TabLineSel", "bg"), gui = "bold" },
              inactive = { fg = hl("LineNr",  "fg"),  bg = hl("TabLineFill", "bg") },
            },
          },
        },
        lualine_z = { "tabs" },
      },
    })
  end,
}
