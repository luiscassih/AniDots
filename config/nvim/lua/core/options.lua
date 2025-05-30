vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false
vim.opt.ignorecase = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.conceallevel = 2

vim.opt.scroll = 8
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.mouse="nvi"

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end
})

-- global statusline
vim.opt.laststatus=3

-- listtchars
vim.opt.list = true
-- vim.opt.listchars:append("lead:⋅")
-- vim.opt.listchars:append("eol:󰌑")
vim.opt.listchars:append("tab:▸ ")
vim.opt.listchars:append("trail:⋅")

vim.opt.winborder = "rounded"
