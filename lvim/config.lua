-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.plugins = {
  "mfussenegger/nvim-jdtls",
  {
    "scalameta/nvim-metals",
    config = function()
      require("user.metals").config()
    end,
  },
  "Shatur/neovim-ayu"
}
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })
lvim.builtin.treesitter.ensure_installed = {
  "java",
}

lvim.colorscheme = "ayu-dark"


local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint", filetypes = { "typescript", "typescriptreact" } }
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    command = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
  },
}
local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup({
  {
    command = "eslint_d",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "vue"
    },
  },
})

local dap = require('dap')
dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "Run or Test Target",
    metals = {
      runType = "runOrTestFile",
    },
  },
}

---------------------- KEYMAPS ------------------------------------
lvim.keys.normal_mode["<leader>c>"] = false

lvim.builtin.which_key.mappings["l"]["f"] = {
  function()
    vim.lsp.buf.format({ timeout = 6000 })
  end,
  "LSP format",
}

