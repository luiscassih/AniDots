return {
  "EdenEast/nightfox.nvim",
  config = function()
    vim.cmd.colorscheme("carbonfox")
    -- vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "FloatBorder", { fg= "#161616",  bg = "#0C0C0C" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg= "#555555",  bg = "#0C0C0C" })
    vim.api.nvim_set_hl(0, "FloatTitle", { bg = "#0C0C0C" })
    vim.api.nvim_set_hl(0, "FloatShadow", { bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "FloatShadow", { bg = "#0C0C0C" })
    -- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#0C0C0C", bg = "#161616" })
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#181818" })
    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg= "#555555",  bg = "#0C0C0C" })
    vim.api.nvim_set_hl(0, "BlinkCmpMenu", { fg= "NONE",  bg = "#0C0C0C" })
    vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg= "#555555",  bg = "#0C0C0C" })
    vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg= "NONE",  bg = "#0C0C0C" })
  end
}
