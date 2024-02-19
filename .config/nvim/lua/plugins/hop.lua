require('hop').setup {
}

local hop = require('hop')
local directions = require('hop.hint').HintDirection

vim.keymap.set('', '<leader>f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR })
end, { remap = true })

vim.keymap.set('', '<leader>F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR })
end, { remap = true })
