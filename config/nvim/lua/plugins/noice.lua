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
            style = GetBorderAscii(),
          },
          position = {
            row = 2,
            col = 0,
          },
        },
        mini = {
          win_options = {
            winhighlight = {
              Normal = "NoiceMiniNormal",
              NormalNC = "NoiceMiniNormalNC",
              FloatBorder = "NoiceMiniFloatBorder",
            },
          },
          border = {
            style = GetBorderAscii(),
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
