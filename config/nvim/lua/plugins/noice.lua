return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local noice = require("noice")
    noice.setup({
      cmdline = {
        view = "cmdline",
      },
      lsp = {
        signature = {
          auto_open = { enabled = false },
        },
      },
      presets = {
        lsp_doc_border = true,
      },
      -- routes = {
      --   {
      --     view = "notify",
      --     filter = { event = "msg_showmode" },
      --   },
      -- },
    })
  end
}
