if vim.g.use_copilot then
    -- Disable by default
    -- vim.g.copilot_filetypes = { ["*"] = false }
    -- Suggest completions explicitly via Ctrl-P
    vim.keymap.set('i', '<C-p>', 'copilot#Suggest()', { noremap = true, silent = true, expr = true, replace_keycodes = false })
    -- Accept completions with Ctrl-Tab
    vim.keymap.set('i', '<C-Tab>', 'copilot#Accept()', { noremap = true, silent = true, expr = true, replace_keycodes = false })

    vim.g.copilot_no_tab_map = true

    require("CopilotChat").setup {}
end
