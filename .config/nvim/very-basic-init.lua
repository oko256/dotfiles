-- Set some stuff if running Neovide
if vim.g.neovide then
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_cursor_animation_length = 0
end
-- Set font if running Windows
if vim.loop.os_uname().sysname == "Windows_NT" then
    vim.o.guifont = "Consolas:h11"
end

vim.cmd [[colorscheme lunaperche]]
vim.cmd [[set title]]
vim.cmd [[set number]]
