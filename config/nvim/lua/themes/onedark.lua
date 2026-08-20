return {
  "navarasu/onedark.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('onedark').setup {
      style = 'darker',
      transparent = true,
    }
    require('onedark').load()
    -- ApplyThemeCustoms()
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "#0C0C0C", fg = "#B6B8BB" })
  end
}
