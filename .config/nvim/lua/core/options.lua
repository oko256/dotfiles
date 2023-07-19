local g = vim.g         -- Shorthand for global variables
local opt = vim.opt     -- Shorthand for options (global/buffer/window)

opt.number = true       -- Enable line numbers
opt.cursorline = true   -- Highlight current line of the cursor
opt.signcolumn = 'yes'  -- Always show signcolumn to stop columns from jumping

-- Use spaces instead of tabs and always indent 4 spaces
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true

opt.undofile = true     -- Enable undofile for persistent undo

-- opt.autochdir = true    -- Change to working directory of current file
                        -- Disabled for now because some it breaks some plugins :(

-- Ignore case in searches except when there's an uppercase character in search terms
g.ignorecase = true
g.smartcase = true

-- opt.colorcolumn = '80'  -- Highlight column 80 to discourage too long lines

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


-- Disable some built-in plugins that interfere with our plugins
local disabled_built_ins = {
    'netrw',
    'netrwPlugin',
    'netrwFileHandlers',
}

for _, plugin in pairs(disabled_built_ins) do
    g['loaded_' .. plugin] = 1
end
