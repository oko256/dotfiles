local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>E', function()
    local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
    if vim.v.shell_error == 0 then
        builtin.find_files({cwd = root})
    else
        builtin.find_files()
    end
end, {})
vim.keymap.set('n', '<leader>g', function()
    local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
    if vim.v.shell_error == 0 then
        builtin.live_grep({cwd = root})
    else
        builtin.live_grep()
    end
end, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
vim.keymap.set('n', '<leader>t', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>T', builtin.builtin, {})
