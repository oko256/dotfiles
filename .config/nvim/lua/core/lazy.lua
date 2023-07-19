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

    { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' } },

    -- { 'freddiehaddad/feline.nvim' },
    --
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

    { 'phaazon/hop.nvim', branch = 'v2' },

    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

})
