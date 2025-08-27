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

   {
     "folke/flash.nvim",
     event = "VeryLazy",
     ---@type Flash.Config
     opts = {},
     -- stylua: ignore
     keys = {
       { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
       { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
       --{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
       --{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
       --{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
     },
   },

   --'nvim-treesitter/playground'

   'mbbill/undotree',

   'tpope/vim-fugitive',

   'lewis6991/gitsigns.nvim',

   'kelly-lin/ranger.nvim',

   'cascassette/vim-indentwise',

   'elzr/vim-json',

   'tpope/vim-surround',

   'hrsh7th/nvim-insx',

   'prettier/vim-prettier',

   'christoomey/vim-tmux-navigator',

   'nvim-tree/nvim-tree.lua',

   'qpkorr/vim-bufkill',

   'windwp/nvim-ts-autotag',

   'folke/zen-mode.nvim',
   'folke/twilight.nvim',

   'tzachar/highlight-undo.nvim',

   'iofq/dart.nvim',

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
