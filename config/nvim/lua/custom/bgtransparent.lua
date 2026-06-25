function SetTransparentBackground()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
  vim.api.nvim_set_hl(0, "SnacksPicker", { bg = "none" })
  vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })
  vim.api.nvim_set_hl(0, "FloatShadow", { bg = "none" })
  vim.api.nvim_set_hl(0, "SnacksBackdrop", { bg = "none" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
  vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
end

function ApplyThemeCustoms()
  local base = {bg = "#161616", fg = "#F2F4F8"}
  local base_dark = {bg = "#0C0C0C", fg = "#F2F4F8"}
  local bg_base_dark = {bg = "#0C0C0C" }
  local border = {bg = "#0C0C0C", fg = "#555555"}
  local border_lighter = {bg = "#0C0C0C", fg = "#7B7C7E"}
  local fg_border_lighter = {fg = "#7B7C7E"}
  vim.api.nvim_set_hl(0, "Normal", base)
  vim.api.nvim_set_hl(0, "NormalFloat", base_dark)
  vim.api.nvim_set_hl(0, "FloatBorder", border)
  vim.api.nvim_set_hl(0, "NormalNC", base)
  vim.api.nvim_set_hl(0, "LineNr",  fg_border_lighter)
  vim.api.nvim_set_hl(0, "FoldColumn", fg_border_lighter)
  vim.api.nvim_set_hl(0, "SignColumn", fg_border_lighter)
  vim.api.nvim_set_hl(0, "SnacksPicker", base_dark)
  vim.api.nvim_set_hl(0, "FloatTitle", bg_base_dark)
  vim.api.nvim_set_hl(0, "FloatShadow", vim.empty_dict())
  vim.api.nvim_set_hl(0, "SnacksBackdrop", bg_base_dark)
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#0C0C0C", fg = "#B6B8BB" })
  vim.api.nvim_set_hl(0, "TabLine", bg_base_dark)
  vim.api.nvim_set_hl(0, "FloatBorder", border)
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#181818" })
  vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", border)
  vim.api.nvim_set_hl(0, "BlinkCmpMenu", bg_base_dark)
  vim.api.nvim_set_hl(0, "BlinkCmpKind", bg_base_dark)
  vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", border)
  vim.api.nvim_set_hl(0, "BlinkCmpDoc", bg_base_dark)
  vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", bg_base_dark)
end
