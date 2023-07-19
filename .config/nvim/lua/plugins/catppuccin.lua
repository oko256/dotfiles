require('catppuccin').setup {
    color_overrides = {
        mocha = {
            base = "#060606",
            mantle = "#101010",
            crust = "#1a1a1a",
        },
    },
}

vim.cmd.colorscheme 'catppuccin-mocha'
