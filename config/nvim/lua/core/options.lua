local o, opt = vim.o, vim.opt
opt.guicursor = ""
opt.nu = false
opt.relativenumber = false

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true
opt.splitbelow = true
opt.splitright = true

opt.wrap = false
opt.ignorecase = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true
opt.conceallevel = 2

opt.scroll = 8
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.mouse="nvi"

o.cmdwinheight = 30
o.colorcolumn = "+0"
opt.fillchars = {
  eob = " ",
  diff = "╱",
  fold = " ",
  foldclose = tools.ui.icons.r_chev,
  foldopen = tools.ui.icons.d_chev,
  foldsep = " ",
  msgsep = "━",
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}

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

-- vim.opt.winborder = "rounded"

vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    vim.cmd("wincmd =")
  end
})
