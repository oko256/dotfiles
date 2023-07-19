local function my_on_attach(bufnr)
    local api = require 'nvim-tree.api'
    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    api.config.mappings.default_on_attach(bufnr)
    -- Custom key mappings:
    vim.keymap.set('n', '<Space>', api.tree.change_root_to_node, opts('CD'))
end

require('nvim-tree').setup {
    on_attach = my_on_attach,
}
