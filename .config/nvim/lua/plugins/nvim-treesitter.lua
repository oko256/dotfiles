require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'bash', 'c', 'cpp', 'json', 'lua', 'python', 'vim', 'yaml',
    },
    sync_install = false,
    highlight = {
        -- False here will disable the whole plugin
        enable = true,
    },
}
