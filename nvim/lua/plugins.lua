local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

-- auto compile when save file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])



vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Dashboard nvim
  use {
    'nvimdev/dashboard-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  -- Theme
  use 'svrana/neosolarized.nvim'
  use 'tjdevries/colorbuddy.nvim'
  --use 'tjdevries/gruvbuddy.nvim'
  use 'olivercederborg/poimandres.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use "EdenEast/nightfox.nvim"
  use "folke/tokyonight.nvim"
  use { "scottmckendry/cyberdream.nvim" }

  -- Statusline
  -- use 'nvim-lualine/lualine.nvim'
  use 'windwp/windline.nvim'

  -- File icons
  use 'kyazdani42/nvim-web-devicons'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'nvimdev/lspsaga.nvim' -- LSP UIs

  -- For help to install other LSP servers, etc.
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'jay-babu/mason-nvim-dap.nvim'
  use 'jay-babu/mason-null-ls.nvim'

  -- Autocomplete
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'hrsh7th/cmp-path' -- for filesystem paths.
  use 'L3MON4D3/LuaSnip' -- Snippet
  use "rafamadriz/friendly-snippets" --Snippet from vscode
  use 'saadparwaiz1/cmp_luasnip' --Snippet

  -- Syntax highlightings
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Autotag & Autopair
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Fuzzy finder
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Tabs
  use 'akinsho/nvim-bufferline.lua'

  -- Color highlighter
  use 'norcalli/nvim-colorizer.lua'

  -- Code Formatters and Linters
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse

  -- Comment
  use 'terrortylor/nvim-comment'
  use 'JoosepAlviste/nvim-ts-context-commentstring'



  use 'folke/zen-mode.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Debuger
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use 'mfussenegger/nvim-dap'


  -- Chat GPT
  use({
    "jackMort/ChatGPT.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })

  -- Notification
  use { "folke/noice.nvim", requires = { "MunifTanjim/nui.nvim" } }
  use 'rcarriga/nvim-notify'


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
