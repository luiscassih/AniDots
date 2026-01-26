return {
  "EdenEast/nightfox.nvim",
  config = function()
    vim.cmd.colorscheme("carbonfox")
    -- vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg= "#535353",  bg = "#0C0C0C" })
    vim.api.nvim_set_hl(0, "FloatTitle", { bg = "#0C0C0C" })
    vim.api.nvim_set_hl(0, "FloatShadow", { bg = "#0C0C0C" })
  end
}
