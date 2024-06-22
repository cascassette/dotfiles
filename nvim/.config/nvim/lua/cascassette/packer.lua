-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({ function(use)
   use 'wbthomason/packer.nvim'

   use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
   }

   use 'AlexvZyl/nordic.nvim'

   use({ 'rose-pine/neovim', as = 'rose-pine' })

   use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

   --use 'nvim-treesitter/playground'

   use 'mbbill/undotree'

   use 'tpope/vim-fugitive'
   use 'tpope/vim-rhubarb'

   use 'kelly-lin/ranger.nvim'

   use 'cascassette/vim-indentwise'

   use 'elzr/vim-json'

   use 'tpope/vim-surround'

   use 'prettier/vim-prettier'

   use 'christoomey/vim-tmux-navigator'

   use 'nvim-tree/nvim-tree.lua'

   -- Because nvim-tree has that nasty behaviour for :bd
   use 'qpkorr/vim-bufkill'

   use 'windwp/nvim-ts-autotag'

   use 'folke/zen-mode.nvim'
   use 'folke/twilight.nvim'

   use 'tzachar/highlight-undo.nvim'

   use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
   }

   -- Still to be properly configured
   --"let g:prettier#autoformat = 0
   --autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

   use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
         -- LSP Support
         {'neovim/nvim-lspconfig'},             -- Required
         {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
               pcall(vim.cmd, 'MasonUpdate')
            end,
         },
         {'williamboman/mason-lspconfig.nvim'}, -- Optional

         -- Autocompletion
         {'hrsh7th/nvim-cmp'},     -- Required
         {'hrsh7th/cmp-nvim-lsp'}, -- Required
         {'L3MON4D3/LuaSnip'},     -- Required
      }
   }
end,
config = {
   display = {
      open_fn = function()
         return require('packer.util').float({ border = 'single' })
      end
   }
}})
