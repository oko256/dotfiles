require('Navigator').setup()

vim.keymap.set({'n', 't'}, '<S-Left>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({'n', 't'}, '<S-Right>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({'n', 't'}, '<S-Up>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({'n', 't'}, '<S-Down>', '<CMD>NavigatorDown<CR>')
