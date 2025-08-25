return {
  "folke/zen-mode.nvim",
  config = function()
    local zen = require("zen-mode")
    zen.setup{}
    vim.keymap.set("n", "<leader>zm", function()
      zen.toggle({
        window = {
          width = .80,
          options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
            cursorline = false,
            cursorcolumn = false,
            foldcolumn = "0",
            list = false,
            wrap = true,
          }
        }
      })
    end, { desc = "Toggle Zen Mode" })
  end
}
