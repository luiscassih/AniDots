return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    mason.setup({})
    mason_lspconfig.setup({
      ensure_installed = {
        'ts_ls',
        'rust_analyzer',
        'lua_ls',
        'clangd',
        'gopls',
        'golangci-lint',
        'golangci_lint_ls',
        'tailwindcss',
        'emmet_ls',
        'ols',
        'bashls',
        'csharp_ls',
      },
      automatic_installation = true,
    })
    vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, { desc = "Line Diagnostics" })
    vim.keymap.set("n", "gn", function() vim.diagnostic.goto_next() end, { desc = "Next Diagnostic" })
    vim.keymap.set("n", "gN", function() vim.diagnostic.goto_prev() end, { desc = "Previous Diagnostic" })
    vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, { desc = "Code Actions" })
    vim.keymap.set("n", "<leader>lR", function() vim.lsp.buf.rename() end, { desc = "Rename" })
    vim.keymap.set({ "n", "v" }, "<leader>lf", vim.lsp.buf.format, { desc = "Format Selected" })
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
  end
}
