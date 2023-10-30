require('catppuccin').setup {
    color_overrides = {
        mocha = {
            base = "#060606",
            mantle = "#202020",
            crust = "#1a1a1a",
            surface0 = "#1b1c26",
        },
    },
}

vim.cmd.colorscheme 'catppuccin-mocha'
