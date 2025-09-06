return {
  "luiscassih/AniMotion.nvim",
  -- dir = "~/dev/AniMotion/",
  enabled = true,
  event = "VeryLazy",
  config = function()
    require("AniMotion").setup({
      -- mode = "helix",
      edit_keys = { "c", "d", "s", "r", "y", "p" },
      clear_keys = { "<C-c>" },
      -- color = "Visual",
      -- color = { bg = "#FF00FF" },
    })
  end
}
