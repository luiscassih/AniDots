return {
  "arborist-ts/arborist.nvim",
  config = true
}
-- return {
--     "nvim-treesitter/nvim-treesitter",
--     branch = "main",
--     build = ":TSUpdate",
--     config = function(_, opts)
--       require("nvim-treesitter").setup(opts)
--       local group = vim.api.nvim_create_augroup("TreesitterAutoStart", {})
--       vim.api.nvim_create_autocmd("FileType", {
--         group = group,
--         callback = function(args)
--           pcall(vim.treesitter.start, args.buf)
--         end,
--       })
--     end,
--     opts = {
--       ensure_installed = {
--         "lua",
--         "vim",
--         "vimdoc",
--         "query",
--         "javascript",
--         "typescript",
--         "tsx",
--         "rust",
--         "go",
--         "html",
--         "css",
--         "gdscript",
--         "bash",
--       },
--     },
-- }
