local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>E', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
