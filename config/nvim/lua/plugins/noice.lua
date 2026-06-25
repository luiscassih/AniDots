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
        hover = {
          enabled = true
        },
      },
      views = {
        hover = {
          border = {
            style = {
              "🭽", "▔", "🭾",
              "▕",
              "🭿", "▁", "🭼",
              "▏",
            }
          },
          position = {
            row = 2,
            col = 0,
          },
        }
      },
      presets = {
        lsp_doc_border = false,
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
