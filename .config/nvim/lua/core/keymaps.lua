-- Navigate between splits with Shift + Arrows
vim.keymap.set('n', '<S-Down>',  '<c-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Up>',    '<c-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Right>', '<c-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Left>',  '<c-w>h', { noremap = true, silent = true })

-- Toggle nvim-tree with <leader>e
vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle!<CR>', { noremap = true, silent = true })

-- Enter to jump to subject under cursor in help
vim.cmd('autocmd FileType help nnoremap <buffer> <CR> <C-]>')

-- Clear search highlights with <leader>n
vim.keymap.set('n', '<leader>n', ':noh<CR>', { noremap = true, silent = true })
