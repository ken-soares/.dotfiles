local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
local builtin = require('telescope.builtin')

vim.g.mapleader = ' '

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})

map('n', '<Left>', '<Nop>', opts)
map('n', '<Right>', '<Nop>', opts)
map('n', '<Up>', '<Nop>', opts)
map('n', '<Down>', '<Nop>', opts)


map('n', '<leader>e', '<cmd>Ex<CR>', opts)

