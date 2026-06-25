return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "query",
            "javascript",
            "typescript",
            "tsx",
            "rust",
            "go",
            "html",
            "css",
            "gdscript",
        },
    },
}
