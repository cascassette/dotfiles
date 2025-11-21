-- vim:ts=3:sts=3:sw=3:et
require('lazy').setup({
   -- lsp, completion
   {
      'neovim/nvim-lspconfig',
      dependencies = {
         {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
               library = {
                  -- See the configuration section for more details
                  -- Load luvit types when the `vim.uv` word is found
                  { path = "${3rd}/luv/library", words = { "vim%.uv" } },
               },
            },
         },
         {
            'saghen/blink.cmp',
            dependencies = { 'rafamadriz/friendly-snippets' },
            version = '1.*',
            opts = {
               enabled = function()
                  return not vim.tbl_contains({ "json", "md", "txt", "org" }, vim.bo.filetype) and vim.bo.buftype ~= "prompt"
               end,
               keymap = { preset = 'default' },
               appearance = {
                  nerd_font_variant = 'mono'
               },
               completion = {
                  trigger = {
                     show_on_keyword = true,
                     show_on_trigger_character = true,
                  },
                  list = {
                     selection = {
                        preselect = true,
                        auto_insert = false,
                     },
                  },
                  accept = {
                     dot_repeat = false,
                     create_undo_point = false,
                     auto_brackets = {
                        enabled = false,
                     },
                  },
               },
               signature = {
                  enabled = true,
                  window = {
                     show_documentation = false,
                  },
               },
            },
         },
      },
   },
   {
      'mason-org/mason.nvim',
      opts = {},
   },
   {
      'nvim-treesitter/nvim-treesitter',
      branch = 'main',
      lazy = false,
      build = ':TSUpdate',
   },
   {
      'ivanjermakov/troublesum.nvim',
      config = function()
         require("troublesum").setup()
      end
   },
   {
      'folke/snacks.nvim',
      priority = 1000,
      lazy = false,
      opts = {
         bigfile = { enabled = true }, -- just bigfile, it will disable treesitter/lsp for files that are too big
         dashboard = { enabled = false },
         explorer = { enabled = false },
         indent = { enabled = false },
         input = { enabled = false },
         picker = { enabled = false },
         notifier = { enabled = false },
         quickfile = { enabled = false },
         scope = { enabled = false },
         scroll = { enabled = false },
         statuscolumn = { enabled = false },
         words = { enabled = false },
      },
   },

   -- specific file types
   'elzr/vim-json',
   'prettier/vim-prettier',
   {
      'MeanderingProgrammer/render-markdown.nvim',
      dependencies = {
         'nvim-treesitter/nvim-treesitter',
         'nvim-tree/nvim-web-devicons',
      },
      ft = { 'markdown' },
      opts = {
         latex = {
            enabled = false,
         },
      },
   },

   -- picker
   {{
      'cascassette/telescope.nvim',
      dependencies = {
         'nvim-lua/plenary.nvim',
         { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      }
   }},

   -- navigation
   {
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = {
         modes = {
            char = {
               enabled = false,  -- don't overtake f/F/t/T motions
            }
         }
      },
      keys = {
         { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
         { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
         --{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
         { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Operator Search" },
         --{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
   },
   'jakemason/ouroboros',
   'cascassette/vim-indentwise',
   'christoomey/vim-tmux-navigator',
   'nvim-tree/nvim-tree.lua',
   'qpkorr/vim-bufkill',
   --'romainl/vim-qf',
   {
      'kevinhwang91/nvim-bqf',
      opts = {
         preview = {
            winblend = 0,
         },
      },
   },
   'tzachar/highlight-undo.nvim',
   {
      'iofq/dart.nvim',
      dependencies = {
         'nvim-tree/nvim-web-devicons',
      }
   },
   'mikavilpas/yazi.nvim',
   'nvim-focus/focus.nvim',
   'hiattp/splitwise.nvim',

   -- insertion
   'tpope/vim-surround',
   --'hrsh7th/nvim-insx',
   'windwp/nvim-ts-autotag',

   -- theme
   {{ 'rose-pine/neovim', name = 'rose-pine' }},
   'nvim-mini/mini.statusline',

   -- git
   'tpope/vim-fugitive',
   'tpope/vim-rhubarb', -- github support for fugitive
   'tommcdo/vim-fubitive', -- bitbucket support for fugitive
   'lewis6991/gitsigns.nvim',

   -- sessions
   'folke/persistence.nvim',
})
