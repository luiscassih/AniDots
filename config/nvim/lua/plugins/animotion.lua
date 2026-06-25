return {
  "luiscassih/AniMotion.nvim",
  -- dir = "~/dev/AniMotion/",
  enabled = true,
  event = "VeryLazy",
  config = function()
    local Utils = require("AniMotion.utils")
    require("AniMotion").setup({
      -- mode = "helix",
      edit_keys = { "c", "d", "r", "y", "p" },
      clear_keys = { "<C-c>" },
      word_keys = {
        [Utils.Targets.NextWordStart] = "w",
        [Utils.Targets.NextWordEnd] = "e",
        [Utils.Targets.PrevWordStart] = "b",
        -- [Utils.Targets.NextLongWordStart] = "W",
        -- [Utils.Targets.NextLongWordEnd] = "E",
        -- [Utils.Targets.PrevLongWordStart] = "B",
      }

      -- color = "Visual",
      -- color = { bg = "#FF00FF" },
    })
  end
}
