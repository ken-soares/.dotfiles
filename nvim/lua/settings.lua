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
o.laststatus = 3
o.guicursor = ''
o.mouse = "v" -- Judge if you want.

-- buffer-local options
bo.tabstop = 4
bo.shiftwidth = 4
bo.softtabstop=4
bo.smartindent = true
bo.autoindent = true

-- window-local options
wo.relativenumber = true
wo.nu = true
wo.wrap = false
wo.signcolumn = 'yes'
wo.colorcolumn = '80'

-- highlight trailing whitespaces
vim.cmd([[
set list listchars=tab:\ \ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
autocmd BufWritePre * :%s/\s\+$//e
]])
