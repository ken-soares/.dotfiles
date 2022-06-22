local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- global options
o.exrc = true
o.swapfile = false
o.backup = false
o.incsearch = true
o.hlsearch = false
o.scrolloff = 12
o.termguicolors = true
o.errorbells = false
o.splitright = true
o.splitbelow = true
o.updatetime = 50
o.hidden = true
o.guicursor = ''

-- buffer-local options
bo.tabstop = 4
bo.shiftwidth = 4
bo.smartindent = true
bo.autoindent = true

-- window-local options
wo.relativenumber = true
wo.nu = true
wo.wrap = false
wo.signcolumn = 'yes'
wo.colorcolumn = '80'
