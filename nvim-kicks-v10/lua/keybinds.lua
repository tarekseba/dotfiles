vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>')

-- tabline
vim.keymap.set('n', '<S-l>', ':BufferNext<CR>')
vim.keymap.set('n', '<S-h>', ':BufferPrev<CR>')
vim.keymap.set('n', '<leader>bd', ':BufferClose<CR>')

-- quickfix
vim.keymap.set('n', ']q', ':cnext<CR>')
vim.keymap.set('n', '[q', ':cprev<CR>')

-- inlay_hints
vim.keymap.set('n', '<leader>tih', function()
  vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
end)

-- format
vim.keymap.set('n', '<leader>lf', function()
  vim.lsp.buf.format { async = true }
end)
