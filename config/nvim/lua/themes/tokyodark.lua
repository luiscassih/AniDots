return {
  "tiagovla/tokyodark.nvim",
  opts = {
    -- transparent_background = true,
    custom_highlights = {
      StatusLine = { bg = "none" },
      -- Function = { fg = "#A4AAC1" },
    },
    custom_palette = {
      bg0 = "#090A10",
      -- bg0 = "#0D0D0D",
      green = "#82BB44",
    },
  },
  config = function(_, opts)
    require("tokyodark").setup(opts)
    vim.cmd("colorscheme tokyodark")
  end,
}
