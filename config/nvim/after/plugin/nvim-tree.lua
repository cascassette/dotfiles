local api = require('nvim-tree.api')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require('nvim-tree').setup({
   view = {
      width = 30,
   },
   filters = {
      dotfiles = true,
   },
   git = {
      show_on_dirs = false,
   },
   on_attach = function(bufnr)
      local api = require 'nvim-tree.api'
      local function opts(desc)
         return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set('n', '<Tab>', '<C-w>w', opts('Tab to next window'))
      vim.keymap.set('n', '<C-a>', ':q<CR>', opts('Close tree'))
      vim.keymap.set('n', '<Space>', api.node.open.preview, opts('Preview file'))
      vim.keymap.set('n', 'o', function() api.node.open.edit() api.tree.close() end, opts('Open file and close the tree'))
   end,
})

vim.keymap.set('n', '<C-a>', vim.cmd.NvimTreeFindFile)

-- nvim-tree.lua default mappings:
-- <2-LeftMouse>  Open                  
-- <2-RightMouse> CD                    
-- <C-]>          CD                    
-- <C-E>          Open: In Place        
-- <C-K>          Info                  
-- <C-R>          Rename: Omit Filename 
-- <C-T>          Open: New Tab         
-- <C-V>          Open: Vertical Split  
-- <C-X>          Open: Horizontal Split
-- <BS>           Close Directory       
-- <CR>           Open                  
-- <Tab>          Open Preview          
-- .              Run Command           
-- -              Up                    
-- >              Next Sibling          
-- <              Previous Sibling      
-- B              Toggle No Buffer      
-- C              Toggle Git Clean      
-- D              Trash                 
-- E              Expand All            
-- F              Clean Filter          
-- H              Toggle Dotfiles       
-- I              Toggle Git Ignore     
-- J              Last Sibling          
-- K              First Sibling         
-- O              Open: No Window Picker
-- P              Parent Directory      
-- R              Refresh               
-- S              Search                
-- U              Toggle Hidden         
-- W              Collapse              
-- Y              Copy Relative Path    
-- a              Create                
-- bd             Delete Bookmarked     
-- bmv            Move Bookmarked       
-- [c             Prev Git              
-- c              Copy                  
-- ]c             Next Git              
-- d              Delete                
-- ]e             Next Diagnostic       
-- [e             Prev Diagnostic       
-- e              Rename: Basename      
-- f              Filter                
-- g?             Help                  
-- gy             Copy Absolute Path    
-- m              Toggle Bookmark       
-- o              Open                  
-- p              Paste                 
-- q              Close                 
-- r              Rename                
-- s              Run System            
-- x              Cut                   
-- y              Copy Name             
