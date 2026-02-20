local g = vim.g         -- Shorthand for global variables
local opt = vim.opt     -- Shorthand for options (global/buffer/window)

opt.number = true       -- Enable line numbers
opt.cursorline = true   -- Highlight current line of the cursor
opt.signcolumn = 'yes'  -- Always show signcolumn to stop columns from jumping
opt.colorcolumn = '100' -- Show column 100 at different color

-- Use spaces instead of tabs and always indent 4 spaces
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true

-- C-style indentation pretty similar to WebKit style
opt.cinoptions = ':0,l1,g0,N-s,E-s,(s'

opt.undofile = true     -- Enable undofile for persistent undo

-- opt.autochdir = true    -- Change to working directory of current file
                        -- Disabled for now because some it breaks some plugins :(

-- Ignore case in searches except when there's an uppercase character in search terms
opt.ignorecase = true
opt.smartcase = true

opt.splitright = true   -- Vertical splits open right
opt.splitbelow = false  -- Horizontal splits open above

-- Enable auto indenting and smart indenting
opt.autoindent = true
opt.smartindent = true

opt.scrolloff = 3       -- Scroll window before cursor hits the last line

opt.termguicolors = true    -- Enable 24-bit colors in the TUI
-- opt.lazyredraw = true       -- Enable if scrolling is slow
opt.hidden = true           -- Allow background buffers

-- opt.cmdheight = 2       -- Command line of 2 rows

opt.tabpagemax = 100

-- Better options for session management
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Fold with treesitter by default (but start with all folds open)
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldminlines = 4
opt.foldlevelstart = 99

-- Faster updatetime for CursorHold events
opt.updatetime = 1000

-- Disable some built-in plugins that interfere with our plugins
local disabled_built_ins = {
    'netrw',
    'netrwPlugin',
    'netrwFileHandlers',
}

for _, plugin in pairs(disabled_built_ins) do
    g['loaded_' .. plugin] = 1
end
