return {
  "00msjr/nvim-fountain",
  ft = "fountain",  -- Lazy-load only for fountain files
  config = function()
    require("nvim-fountain").setup({
      -- Optional configuration
      keymaps = {
        next_scene = "gn",
        prev_scene = "gN",
        uppercase_line = "gu",
      },
      -- Export configuration
      export = {
        pdf = { options = "--overwrite" },
      },
    })

    vim.keymap.set("n", "<leader>fe", "<cmd>:FountainExportPDF<cr>")
  end,
}
