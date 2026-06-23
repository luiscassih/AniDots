return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  branch = "main",
  config = function()
    local ts = require('nvim-treesitter.configs')
    ts.install { "typescript", "tsx", "css", "html", "latex", "scss", "svelte", "typst", "vue", "cpp", "javascript", "rust", "go", "lua", "vim", "vimdoc", "query", "http", "json", "gdscript", "markdown_inline", "regex" }
  end
}
