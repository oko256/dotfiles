-- Set leader in the very beginning to make sure it takes effect for plugins
vim.g.mapleader = ','

require('core/lazy')
require('core/options')
require('core/keymaps')
require('plugins/nvim-lspconfig')
require('plugins/nvim-tree')
require('plugins/catppuccin')
require('plugins/lualine')
require('plugins/nvim-cmp')
require('plugins/nvim-treesitter')
require('plugins/guess-indent')
require('plugins/hop')
require('plugins/telescope')
