-- PLUGINS KEYMAPS --
--
-- NeoTree
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>')

-- Tabline
vim.keymap.set('n', '<S-l>', ':BufferNext<CR>')
vim.keymap.set('n', '<S-h>', ':BufferPrev<CR>')
vim.keymap.set('n', '<leader>bd', ':BufferClose<CR>')
vim.keymap.set('n', '<leader>b[', ':BufferMovePrev<CR>')
vim.keymap.set('n', '<leader>b]', ':BufferMoveNext<CR>')
vim.keymap.set('n', '<leader>bs', ':BufferMoveStart<CR>')
-- UndoTree
vim.keymap.set('n', '<leader>ut', ':UndotreeToggle<CR>')

-- GENERAL
--
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

-- Move selection
-- echo getpos("'<") to print position
vim.keymap.set('v', 'K', ":move '<-2<CR>gv-gv")
vim.keymap.set('v', 'J', ":move '>+1<CR>gv-gv")
