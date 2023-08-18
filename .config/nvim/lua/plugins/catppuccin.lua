require('catppuccin').setup {
    color_overrides = {
        mocha = {
            base = "#060606",
            mantle = "#202020",
            crust = "#1a1a1a",
        },
    },
}

vim.cmd.colorscheme 'catppuccin-mocha'
