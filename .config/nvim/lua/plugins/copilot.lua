if vim.g.use_copilot then
    -- Disable by default
    vim.g.copilot_filetypes = { ["*"] = false }
    -- Suggest completions only explicitly via Ctrl-Tab
    vim.keymap.set('i', '<C-Tab>', 'copilot#Suggest()', { noremap = true, silent = true, expr = true, replace_keycodes = false })

    require("CopilotChat").setup {}
end
