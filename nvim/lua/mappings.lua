local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

vim.g.mapleader = ' '
 
map('n', '<leader>e',':NvimTreeToggle<CR>',opts)
map('n', '<F8>', ':MinimapToggle<CR>',opts)
map('n', '<Left>', '<Nop>', opts)
map('n', '<Right>', '<Nop>', opts)
map('n', '<Up>', '<Nop>', opts)
map('n', '<Down>', '<Nop>', opts)

-- for the hhkb
map('i','<C-Space>', '<Esc>', opts)

