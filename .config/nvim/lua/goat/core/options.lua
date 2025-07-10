vim.cmd([[autocmd BufEnter * set formatoptions-=cro]])

local opt = vim.opt

vim.opt.relativenumber = true
vim.cmd("set nu rnu")

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- vim.opt.signcolumn = "yes"
-- vim.opt.colorcolumn = "80"

vim.opt.termguicolors = true

vim.opt.updatetime = 50

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.autoread = true
