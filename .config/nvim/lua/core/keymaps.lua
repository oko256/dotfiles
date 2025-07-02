-- Navigate between splits with Shift + Arrows
-- vim.keymap.set('n', '<S-Down>',  '<c-w>j', { noremap = true, silent = true })
-- vim.keymap.set('n', '<S-Up>',    '<c-w>k', { noremap = true, silent = true })
-- vim.keymap.set('n', '<S-Right>', '<c-w>l', { noremap = true, silent = true })
-- vim.keymap.set('n', '<S-Left>',  '<c-w>h', { noremap = true, silent = true })

-- Toggle nvim-tree with <leader>e
-- vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle!<CR>', { noremap = true, silent = true })
-- Open parent directory of current file in floating Oil file explorer
vim.keymap.set('n', '<leader>e', '<CMD>Oil --float<CR>', { desc = "Open parent directory of current file" })

-- Enter to jump to subject under cursor in help
vim.cmd('autocmd FileType help nnoremap <buffer> <CR> <C-]>')

-- Clear search highlights with <leader>n
vim.keymap.set('n', '<leader>n', ':noh<CR>', { noremap = true, silent = true })

-- Exit insert mode in terminal with <leader><Esc>
vim.keymap.set('t', '<leader><Esc>', '<C-\\><c-n>', { noremap = true, silent = true })

-- Use <leader>s to switch between header and source in clangd supported files
vim.keymap.set('n', '<leader>s', ':ClangdSwitchSourceHeader<CR>', { noremap = true, silent = true })
