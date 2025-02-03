-- Get Lazy plugin manager from Github if it doesn't exist yet
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Run plugin manager
require('lazy').setup({

    { 'catppuccin/nvim', name = 'catppuccin', priority = 1000, lazy = false },

    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { { 'echasnovski/mini.icons', opts = {} } },
        lazy = false,
    },

    { 'nvim-lualine/lualine.nvim' },

    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    { 'neovim/nvim-lspconfig' },

    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
        },
    },

    { 'nmac427/guess-indent.nvim' },

    { 'smoka7/hop.nvim', version = '*', opts = {} },

    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    { 'ten3roberts/window-picker.nvim' },

    { 'rhysd/git-messenger.vim' },

    { 'numToStr/Navigator.nvim' },

    {
        'iamcco/markdown-preview.nvim',
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    {
        'smoka7/multicursors.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvimtools/hydra.nvim' },
        opts = {},
        cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
        keys = {
            {
                mode = { 'v', 'n' },
                '<Leader>m',
                '<cmd>MCstart<cr>',
                desc = 'Create a selection for selected text or word under the cursor',
            },
        },
    },

    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    {
        'rmagatti/auto-session',
        lazy = false,
        lazy_support = true,
        opts = {
            auto_create = false,
        },
    },

    {
        'github/copilot.vim',
        enabled = vim.g.use_copilot,
    }

})
