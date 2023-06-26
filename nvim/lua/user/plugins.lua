local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "numToStr/Comment.nvim" -- Easily comment stuff

  use { "mfussenegger/nvim-jdtls", ft = { "java" } }

  -- GITSIGNS
  use "lewis6991/gitsigns.nvim"

  -- Nvim-tree 
  use "kyazdani42/nvim-web-devicons"

  use 'voldikss/vim-floaterm'

  -- Barbar
  use "akinsho/bufferline.nvim"

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "ellisonleao/gruvbox.nvim"
  use "navarasu/onedark.nvim"
  use "folke/tokyonight.nvim"
  use "catppuccin/nvim"
  use "Shatur/neovim-ayu"

  -- Color highlighter 
  use "norcalli/nvim-colorizer.lua"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- Language server protocol
  use "hrsh7th/cmp-nvim-lua"
  use "jose-elias-alvarez/null-ls.nvim"
  use 'weilbith/nvim-code-action-menu' 
  use 'kyazdani42/nvim-tree.lua'

  -- TREESITTER
  use {
    "nvim-treesitter/nvim-treesitter"
  }
 use "nvim-treesitter/playground"
 use 'nvim-treesitter/nvim-treesitter-context'

 use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Scrollbar
  use("petertriho/nvim-scrollbar")

  -- Close parenthes 
  use "windwp/nvim-autopairs"
  use "lukas-reineke/indent-blankline.nvim"

  -- Rainbow parentheses
  use "p00f/nvim-ts-rainbow"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- SCALA LSP
  --[[ use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }}) ]]

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  -- LUALINE
  use "nvim-lualine/lualine.nvim"

  -- OPENAI
  use ({
      "Bryley/neoai.nvim",
      require = { "MunifTanjim/nui.nvim" },
  })

  -- BETTER MOTIONS
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

