function AddSurrounding()
  vim.ui.input({ prompt = 'Surround with: ' }, function(input)
    if input == nil or input == '' then
      return
    end
    vim.cmd('normal! d')
    local content = vim.fn.getreg('"')
    local pairs = {
      ["["] = {"[", "]"},
      ["]"] = {"[", "]"},
      ["("] = {"(", ")"},
      [")"] = {"(", ")"},
      ["{"] = {"{", "}"},
      ["}"] = {"{", "}"},
    }
    local surround = pairs[input] or {input, input}
    content = table.concat({surround[1], content, surround[2]})
    vim.fn.setreg('"', content)
    vim.cmd('normal! P')
  end)
end

vim.keymap.set('v', '<leader>is', function () AddSurrounding() end)
