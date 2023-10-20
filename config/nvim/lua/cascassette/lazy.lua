require('lazy').setup({
   'nvim-lua/plenary.nvim',
   'neovim/nvim-lspconfig',
   'hrsh7th/nvim-cmp',

   {{
      'nvim-telescope/telescope.nvim',
      -- or                          , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
   }},

   {{ 'rose-pine/neovim', name = 'rose-pine' }},

   {{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' }},

   --'nvim-treesitter/playground'

   'mbbill/undotree',

   'tpope/vim-fugitive',

   'kelly-lin/ranger.nvim',

   'cascassette/vim-indentwise',

   'elzr/vim-json',

   'tpope/vim-surround',

   'prettier/vim-prettier',

   'christoomey/vim-tmux-navigator',

   'nvim-tree/nvim-tree.lua',

   'qpkorr/vim-bufkill',

   'windwp/nvim-ts-autotag',

   'folke/zen-mode.nvim',
   'folke/twilight.nvim',

   'tzachar/highlight-undo.nvim',

   'nvim-lualine/lualine.nvim',

   -- Still to be properly configured
   --"let g:prettier#autoformat = 0
   --autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

   'williamboman/mason.nvim',

   {{
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
   }}
})
