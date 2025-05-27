return {
  'Exafunction/windsurf.vim',
  config = function ()
    vim.g.codeium_disable_bindings = 1
    vim.keymap.set('i', '<c-l>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-j>', function() return vim.fn['codeium#CycleOrComplete']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  end
}
