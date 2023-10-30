require'window-picker'.setup{
  -- Default keys to annotate, keys will be used in order. The default uses the
  -- most accessible keys from the home row and then top row.
  keys = 'alskdjfhgwoeiruty',
  -- Swap windows by holding shift + letter
  swap_shift = false,
  -- Windows containing filetype to exclude
  exclude = { qf = true, NvimTree = true, aerial = true },
  -- Flash the cursor line of the newly focused window for 300ms.
  -- Set to 0 or false to disable.
  flash_duration = 300,
}

-- Example keymaps

-- Move to window, or swap by using shift + letter (if swap_shift)
vim.keymap.set('n', '<leader>ww', ":WindowPick<CR>", { silent = true })

-- Swap with any window
vim.keymap.set('n', '<leader>ws', ":WindowSwap<CR>", { silent = true })
vim.keymap.set('n', '<leader>wq', ":WindowZap<CR>", { silent = true })
