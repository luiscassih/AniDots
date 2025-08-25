return {
  "mcauley-penney/techbase.nvim",
  config = function()
    vim.cmd.colorscheme("techbase")
    -- local bg = "#070809"
    local bg = "#0d0d0d" -- hsl 0 0 5%
    local border = "#1a1a1a" -- hsl 0 0 10%
    vim.api.nvim_set_hl(0, "Normal", { bg = bg })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = bg })
    vim.api.nvim_set_hl(0, "FloatTitle", { bg = bg })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg="#2A2F39", bg = bg })
    vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = bg })
    vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = bg })
    vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = border, bg = bg })
    vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { fg = border, bg = bg })
  end,
  priority = 1000
}
