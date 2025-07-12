return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      -- transparent_mode = true,
    })
    vim.cmd.colorscheme("gruvbox")
    -- vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
  end
}
