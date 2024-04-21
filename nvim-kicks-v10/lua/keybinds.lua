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

-- ////////////////////////////// LSP ////////////////////////////////
-- Go to defintion vsplit
vim.keymap.set('n', 'gsd', ':LspDefinition<CR>')

-- inlay_hints
vim.keymap.set('n', '<leader>tih', function()
  vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
end)

-- format
vim.keymap.set('n', '<leader>lf', function()
  vim.lsp.buf.format { async = true }
end)

-- ////////////////////////////// GENERAL ////////////////////////////////
--
-- quickfix
vim.keymap.set('n', ']q', ':cnext<CR>')
vim.keymap.set('n', '[q', ':cprev<CR>')

-- Move selection
-- echo getpos("'<") to print position
vim.keymap.set('v', 'K', ":move '<-2<CR>gv-gv")
vim.keymap.set('v', 'J', ":move '>+1<CR>gv-gv")

-- ////////////////////////////////// CUSTOM FUNCTIONS AND COMMANDS ////////////////////////////////////////
function open_def_in_vsplit()
  vim.lsp.buf_request(0, 'textDocument/definition', vim.lsp.util.make_position_params(), function(err, result)
    if err ~= nil then
      print(err)
    else
      res = result[1]
      if res ~= nil then
        local file = result[1].targetUri
        local coord = result[1].targetSelectionRange.start
        vim.cmd(string.format('vsplit %s | call cursor(%s, %s)', file, coord.line + 1, coord.character + 1))
      end
    end
  end)
end

vim.cmd [[ command! LspDefinition lua open_def_in_vsplit()]]
