local keymap = vim.keymap
local builtin = require("telescope.builtin")

-- set leader key
vim.g.mapleader = ' '

-- increment / decrement with + and -
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- select all
keymap.set('n', '<C-a>', 'gg<S-v>G')
keymap.set('i', '<C-BS>', '<C-w>')

-- new tabs
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })


keymap.set('n', '<C-f>h', '<C-w><')
keymap.set('n', '<C-f>l', '<C-w>>')
keymap.set('n', '<C-f>j', '<C-w>-')
keymap.set('n', '<C-f>k', '<C-w>+')


keymap.set('n', "<leader>t", ':NvimTreeToggle<CR>', { silent = true })

vim.keymap.set('n', '<leader>f',
    function()
        builtin.find_files({
            no_ignore = false,
            hidden = true
        })
    end)


vim.keymap.set('n', '<leader>r', function()
    builtin.live_grep()
end)
vim.keymap.set('n', '<leader>b', function()
    builtin.buffers()
end)


-- emmet keybindings
vim.cmd [[let g:user_emmet_leader_key=',']]
