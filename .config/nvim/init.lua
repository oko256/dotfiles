-- Set leader in the very beginning to make sure it takes effect for plugins
vim.g.mapleader = ','

-- Set this if you want to use Copilot or not
vim.g.use_copilot = false

require('core/lazy')
require('core/options')
require('core/keymaps')
require('plugins/nvim-lspconfig')
require('plugins/catppuccin')
require('plugins/lualine')
require('plugins/nvim-cmp')
require('plugins/nvim-treesitter')
require('plugins/guess-indent')
require('plugins/hop')
require('plugins/telescope')
require('plugins/window-picker')
require('plugins/navigator')
