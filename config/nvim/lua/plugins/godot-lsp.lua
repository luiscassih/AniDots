return {
  "dpowling/godot-lsp.nvim",
  ft = "gdscript, gdshader, gdshaderinc",
  opts = { },
  config = function(_, opts)
    require("godot-lsp").setup(opts)
    vim.lsp.config("gdshader_lsp", {
      cmd = {
        "$HOME/.dotfiles/bin/gdshader-lsp-release",
        "--stdio --log-path=/var/log/gdshader-lsp.log",
      },
      filetypes = { "gdshader", "gdshaderinc" },
      root_markers = { "project.godot", ".git" },
    })
    vim.lsp.enable("gdshader_lsp")
  end
}
