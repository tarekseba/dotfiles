require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment" 
require "user.gitsigns"
require "user.nvim-tree"
require "user.lualine" 
require "user.chighlighter"
require "user.blanklines"
require "user.bufferline"
require "user.treesitter-context"
require "user.scrollbar"
--[[ vim.cmd('source /home/tarekseba/.config/nvim/vimscript/plugins.vim') ]]
vim.opt.background = "dark"
-- vim.cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach({})]])